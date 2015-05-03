classdef MyMultiPerceptron < handle
    properties
        weights
        gamma
        fi
        fa
        fd
        fal
        fdl
        arq
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
                        %fa = @(t) (t > 45) * 1 + (-45 < t && t < 45) * (1/(1+exp(1)^(-t)));
                        fd = @(t) fa(t)*(1-fa(t));
                        fal = @(t) t;
                        fdl = @(t) 1;
                    case 'binary'
                        fi = @(x) x; % entre [0,1]
                        fa = @(t) 1/(1+exp(1)^(-t));
                        %fa = @(t) (t > 45) * 1 + (-45 < t && t < 45) * (1/(1+exp(1)^(-t)));
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
            this.arq = arq;
            
            this.initWeights(arq);
        end
        
        function initWeights(this, arq)
            % Construye las matrices de pesos relacionando
            % cada capa con la siguiente.
            for i = 1:(size(arq,2)-1)
                % Aplico la funcion de inicializacion
    	    	this.weights{i} = 0.1*rand(arq(i)+1, arq(i+1))*2-1;
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
                Y{i} = [Y{i} 1];
                % Aplica activacion a cada posicion del resultado de Y*W
                % Nota: Es el map de matlab, nada de que asustarse.
                if i == length(this.weights)
                    Y{i+1} = arrayfun(this.fal, Y{i}*this.weights{i});
                else
                    Y{i+1} = arrayfun(this.fa, Y{i}*this.weights{i});
                end
            end
        end
        
        function [ep_errors] = train(this, xs, zs, min_error, max_epoch)
            [model ep_errors] = train_mlp(xs, zs, this.arq, max_epoch, 0.10);
            for i = 1:length(this.weights)
                this.weights{i} = [model.weights{i}; model.biases{i}];
            end
        end
        
        % xs es una matriz en donde cada fila es un input
        % zs es una matriz en donde cada fila coincide con el resultado
        function [ep_errors ferror] = train_orig(this, xs, zs, min_error, max_epoch)
            ferror = min_error + 1;
            ntrain = size(xs,1);
            ep_errors = [];
            epoch = 0;
            
            while (ferror > min_error) && (epoch < max_epoch)
                order = randperm(ntrain);
                ferror = 0;
                epoch = epoch + 1;
                ldeltas = this.resetDeltas();
                for i = 1:ntrain
                    x = xs(order(i),:);
                    z = zs(order(i),:);
                    Y = this.propagateFeed(x);
                    
                    [e, ldeltas] = this.correction_orig(Y, z, ldeltas);
                    this.adaptation(ldeltas);
                    
                    %[e] = this.correction(Y, z);
                    
                    ferror = ferror + e;
                end
                ep_errors = [ep_errors ferror];
                %if mod(epoch, 100) == 0
                %    epoch
                %end
            end
            
            ep_errors = ep_errors / size(xs,1);
        end
        
        function [error, ldeltas] = correction_orig(this, Y, z, ldeltas)
            E = (z-Y{end}); % Tomo el resultado final para inicializar E
            error = sum(E.^2);
            for i = length(this.weights):-1:1
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
        
        function [error] = correction(this, Y, z)
            
            % Variable for holding the errors at each level
            errors = cell(length(this.weights),1);
            
            run_error = (z-Y{end});
            error = sum(run_error.^2);
            
            % Propagate the error back
            for i = length(this.weights):-1:1
                % Multiplico punto a punto el error por la derivada
                % de la funcion de activacion valuada en el resultado
                % de esa capa.
                y = Y{i} * this.weights{i};
                %if i == length(this.weights) && false
                %    errors{i} = ones(size(y)) .* (run_error);
                    %run_error = run_error .* arrayfun(this.fdl, Y{i}*this.weights{i});
                %else
                errors{i} = y .* (1-y) .* (run_error);
                %end
                run_error = errors{i} * this.weights{i}(1:end-1,:)';
                %ldeltas{i} = ldeltas{i} + this.gamma*(Y{i}' * run_error);
                %run_error = run_error * this.weights{i}';
                % No tengo en cuenta el error del bias! Al ser la 
                % traspuesta de los layers saco la ultima columna.
                %run_error = run_error(:,1:(size(run_error,2)-1));
            end
            
            for i = 1:length(this.weights)
                %Y{i}' * errors{i}
                % update weights based on the learning rate, the input activation
                % and the error
                %biases = this.weights{i}(end,:);
                this.weights{i} = this.weights{i} + this.gamma * Y{i}' * errors{i};
                %this.weights{i}(end,:)
                %biases + this.gamma * errors{i}
                % update the neuron biases as well
                % it takes a while to figure out all the matrix operations, but
                % once it's done it's nice.
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