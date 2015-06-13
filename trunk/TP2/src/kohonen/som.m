function [w] = som( dataset, M1, M2, maxEpocas, learningRate, sigma, autoajuste, animate )
    
    if nargin < 8
        animate = false;
    end
    
	% Setear parametros
	epoca = 0;
	N = size(dataset,2);
	w = 0.1 * randn(N,M1*M2);
	deltaw = zeros(N,M1*M2);

	% Entrenamiento
    while epoca < maxEpocas
		epoca
		for d = 1:size(dataset,1)
			x = dataset(d,:);
            
            % Activacion
			r = x'*ones(1, size(w,2))-w;
            yMonio = sum(r.^2);
            [~,jEstrella] = min(yMonio);
			
            % Correccion
			D = distanciasAjEstrella(jEstrella, M1*M2, M2, sigma);
            deltaW = calculoDeltaW(learningRate, D, r);
            
            % Aprendizaje
			w = w + deltaW;
		end

		epoca = epoca+1;

		if autoajuste
			learningRate = epoca^(-0.5);
			sigma = 0.5*M2*epoca^(-1/3);
        end
        
        if animate            
            makeGridGraphic(w, dataset, epoca, M1, M2);
        end
        
    end
    
function [i,j] = P(a,M2)
	i = ceil(a./M2);
	j = mod(a,M2);
    j(j==0) = M2;
    
function [v] = vP(a,M2)
    [x,y] = P(a,M2);
    v = [x;y];

function [D] = distanciasAjEstrella(jEstrella, M, M2, sigma)
    [x,y] = P(jEstrella,M2);
    jPE = ones(M,1) * [x,y];
    new_v = vP((1:M),M2)' - jPE;
    v_norm_2 = abs(sum(new_v.^2,2));
    D = exp(-v_norm_2/(2*sigma^2))';

function [deltaW] = calculoDeltaW(learningRate, D, resta)
    deltaW = learningRate * (ones(size(resta,1),1) * D) .* resta;