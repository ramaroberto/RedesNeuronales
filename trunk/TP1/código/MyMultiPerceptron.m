classdef MyMultiPerceptron < handle
    properties
        weights
        gamma
        fi
        fa
        fd
        fal
        fdl
    end
    
    methods
        function this = MyMultiPerceptron(arq, gamma, mode, fi, fa, fd, fal, fdl)
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
                    case 'binary-regresion'
                        fi = @(x) x; % entre [0,1]
                        fa = @(t) 1/(1+exp(1)^(-t));
                        fd = @(t) fa(t)*(1-fa(t));
                        fal = @(t) t;
                        fdl = @(t) 1;
                    case 'binary'
                        fi = @(x) x; % entre [0,1]
                        fa = @(t) 1/(1+exp(1)^(-t));
                        fd = @(t) fa(t)*(1-fa(t));
                        fal = fa;
                        fdl = fd;
                    case 'bipolar-regresion'
                        fi = @(x) x*2-1; % entre [-1,1]
                        fa = @(t) tanh(t);
                        fd = @(t) 1-(tanh(t)^2);
                        fal = @(t) t;
                        fdl = @(t) 1;
                    otherwise % bipolar
                        fi = @(x) x*2-1; % entre [-1,1]
                        fa = @(t) tanh(t);
                        fd = @(t) 1-(tanh(t)^2);
                        fal = fa;
                        fdl = fd;
                end
            end
            
            this.gamma = gamma;
            this.fi = fi;
            this.fa = fa;
            this.fd = fd;
            this.fal = fal;
            this.fdl = fdl;
            
            this.initWeights(arq);
        end
        
        function initWeights(this, arq)
            % Construye las matrices de pesos relacionando
            % cada capa con la siguiente.
            for i = 1:(size(arq,2)-1)
                % Aplico la funcion de inicializacion
    	    	this.weights{i} = 0.1*this.fi(rand(arq(i)+1, arq(i+1)));
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
            for i = 1:length(this.weights)
                % Agrega el bias
                Y{i} = [Y{i} -1];
                % Aplica activacion a cada posici�n del resultado de Y*W
                % Nota: Es el map de matlab, nada de que asustarse.
                if i == length(this.weights)
                    Y{i+1} = arrayfun(this.fal, Y{i}*this.weights{i});
                else
                    Y{i+1} = arrayfun(this.fa, Y{i}*this.weights{i});
                end
            end
        end
        
        % xs es una matriz en donde cada fila es un input
        % zs es una matriz en donde cada fila coincide con el resultado
        function [ep_errors ferror] = train(this, xs, zs, min_error, max_epoch)
            ep_errors = [];
            ferror = min_error + 1;
            epoch = 0;
            while (ferror > min_error) && (epoch < max_epoch)
                permutation = randperm(size(xs,1));
                ferror = 0;
                epoch = epoch + 1;
                ldeltas = this.resetDeltas();
                for i = 1:size(xs, 1)
                    x = xs(permutation(i),:);
                    z = zs(i);
                    Y = this.propagateFeed(x);
                    [e, ldeltas] = this.correction(Y, z, ldeltas);
                    ferror = ferror + e;
                    this.adaptation(ldeltas);
                end
                ep_errors = [ep_errors ferror];
            end
        end
        
        function [error, ldeltas] = correction(this, Y, z, ldeltas)
            y = Y{length(Y)}; % Tomo el resultado final para inicializar E
            E = (z-y);
            error = sum(E.^2);
            for i = length(this.weights):-1:1
                % NOTE: Si se quiere mas performance, corregir esto.
                % No es lo mismo Y{i} * this.layers{i}, que Y{i+1}.
                % Como no es lo mismo un metro de encaje negro,
                % que un negro te encaje un metro. La igualdad es
                % Y{i} * this.layers{i} = Y{i+1}(1:length(Y{i+1}-1))
                % Se complica porque el primer Y no tiene el -1 y rompe.
                
                % Multiplico punto a punto el error por la derivada
                % de la funcion de activacion valuada en el resultado
                % de esa capa.
                if i == length(this.weights)
                    E = E .* arrayfun(this.fdl, Y{i}*this.weights{i});
                else
                    E = E .* arrayfun(this.fd, Y{i}*this.weights{i});
                end
                ldeltas{i} = ldeltas{i} + this.gamma*(Y{i}' * E);
                E = E*(this.weights{i})';
                % No tengo en cuenta el error del bias! Al ser la 
                % traspuesta de los layers saco la ultima columna.
                E = E(:,1:(size(E,2)-1));
            end
        end
        
        function ldeltas = resetDeltas(this)
            ldeltas{length(this.weights)} = [];
            for i = 1:length(this.weights)
                ldeltas{i} = zeros(size(this.weights{i}));
            end
        end
        
        function adaptation(this, ldeltas)
            for i = 1:length(this.weights)
                this.weights{i} = this.weights{i} + ldeltas{i};
            end
        end
        
    end
end