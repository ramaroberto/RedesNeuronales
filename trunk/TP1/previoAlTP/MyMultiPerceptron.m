classdef MyMultiPerceptron < handle
    properties
        % TODO: Renombrar "layers" a lweights
        layers
        gamma
        fi
        fa
        fd
    end
    
    methods
        function this = MyMultiPerceptron(arq, gamma, mode, fi, fa, fd)
            if nargin < 3
                mode = 'bipolar';
            end
            
            % fi y fa son funciones lambda.
            % * fi es utilizada para la inicializacion y se le pasa por
            %   parametro un valor proveniente de una normal [0,1]
            % * fa es la funcion de activacion de las neuronas
            % * fd es la derivada de la funcion de activacion
            % TODO: Chequear las derivadas
            if not(strcmp(mode, 'custom'))
                switch mode
                    case 'binary'
                        fi = @(x) x; % entre [0,1]
                        fa = @(t) 1/(1+exp(1)^(-t));
                        fd = @(t) fa(t)*(1-fa(t));
                    otherwise % bipolar
                        fi = @(x) x*2-1; % entre [-1,1]
                        fa = @(t) tanh(t);
                        fd = @(t) 1-(tanh(t)^2);
                end
            end
            
            this.gamma = gamma;
            this.fi = fi;
            this.fa = fa;
            this.fd = fd;
            
            this.initLayers(arq);
        end
        
        function initLayers(this, arq)
            % Construye las matrices de pesos relacionando
            % cada capa con la siguiente.
            for i = 1:(size(arq,2)-1)
                % Aplico la funcion de inicializacion
    	    	this.layers{i} = this.fi(rand(arq(i)+1, arq(i+1)));
            end
        end
        
        % x debe ser de tamanio size(this.layers{1},1)(n) y vector fila
        function y = feedForward(this, x)
            Y = this.propagateFeed(x);
            y = Y{length(Y)};
        end
        
        % NOTE: Si no anda la red para testear esto puedo tomar el estado
        % de los layers de otra red ya entrenada y chequear si da el mismo
        % resultado.
        % x es un vector fila
        function Y = propagateFeed(this, x)
            Y{1} = x;
            for i = 1:length(this.layers)
                % Agrega el bias
                Y{i} = [Y{i} -1];
                % Aplica activacion a cada posición del resultado de Y*W
                % Nota: Es el map de matlab, nada de que asustarse.
                Y{i+1} = arrayfun(this.fa, Y{i}*this.layers{i});
            end
        end
        
        % xs es una matriz en donde cada fila es un input
        % zs es una matriz en donde cada fila coincide con el resultado
        function train(this, xs, zs, min_error, max_epoch)
            error = min_error + 1;
            epoch = 0;
            while (error > min_error) && (epoch < max_epoch)
                error = 0;
                epoch = epoch + 1;
                ldeltas = this.resetDeltas();
                for i = 1:size(xs, 1)
                    x = xs(i,:);
                    z = zs(i);
                    Y = this.propagateFeed(x);
                    [e, ldeltas] = this.correction(Y, z, ldeltas);
                    error = error + e;
                end
                this.adaptation(ldeltas);
            end
        end
        
        function [error, ldeltas] = correction(this, Y, z, ldeltas)
            y = Y{length(Y)}; % Tomo el resultado final para inicializar E
            E = (z-y);
            for i = size(Y):-1:1
                E = E .* arrayfun(this.fd, Y{i}*this.layers{i});
                ldeltas{i} = ldeltas{i} + this.gamma*(Y{i}' * E);
                E = E*(this.layers{i})';
                % No tengo en cuenta el error del bias!
                % NOTE: Como coinciden aca los tamanios?
                % E = E(1:length(E)-1);
            end
            error = sum(E.^2);
        end
        
        function ldeltas = resetDeltas(this)
            ldeltas{length(this.layers)} = [];
            for i = 1:length(this.layers)
                ldeltas{i} = zeros(size(this.layers{i}));
            end
        end
        
        function adaptation(this, ldeltas)
            for i = 1:length(this.layers)
                this.layers{i} = this.layers{i} + ldeltas{i};
                % Manda todo a cero
                %ldeltas{i} = ldeltas{i} .* 0; % Ya lo estoy haciendo >L82
            end
        end
        
    end
end