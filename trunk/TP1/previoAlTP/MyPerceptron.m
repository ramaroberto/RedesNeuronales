classdef MyPerceptron < handle
    properties
        weights
        gamma
    end
    
    methods
        function this = MyPerceptron(n, gamma)
            % 1 more dimension for bias
            %this.weights = zeros(n+1,1);
            %this.weights = rand(n+1,1);
            this.weights = rand(n+1,1);
            this.gamma = gamma;
        end
        
        function y = feedForward(this, x)
            y = this.activation([x -1] * this.weights);
        end
        
        function r = activation(~, t)
            r = 1/(1+exp(1)^(-t));
        end
        
        % xs es una matriz en donde cada fila es un input
        % zs es un vector en donde cada posicion coincide con el resultado
        function learning(this, xs, zs, min_error, max_epoch)
            error = min_error+1;
            epoch = 0;
            while (error > min_error) && (epoch < max_epoch)
                error = 0;
                epoch = epoch + 1;
                for i = 1:size(xs, 1)
                    x = xs(i,:);
                    z = zs(i);
                    y = this.feedForward(x);
                    error = error + this.updateWeights(x, y, z);
                end
            end
        end
        
        function error = updateWeights(this, x, y, z)
            this.weights = this.weights + [x -1]' * this.gamma*(z-y);
            error = (z-y)^2;
        end
    end
end