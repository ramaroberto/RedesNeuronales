function [w] = som( dataset, M1, M2, maxEpocas, learningRate, sigma, autoajuste )
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
			yMonio = resta(x',w);
			y = (yMonio == min(yMonio));
			jEstrella = find(y);
			
            % Correccion
			D = distanciasAjEstrella(jEstrella, M1*M2, M2, sigma);
            
            % Aprendizaje
			deltaW = calculoDeltaW(learningRate, D, yMonio);
			w = w + deltaw;
		end

		epoca = epoca+1;

		if autoajuste
			learningRate = epoca^(-0.5);
			sigma = 0.5*M2*epoca^(-1/3);
		end
	end

function [D] = distanciasAjEstrella(jEstrella, M, M2, sigma)
	for j = 1:M
		[posJi,posJj] = P(j,M2);
		[posJEi,posJEj] = P(jEstrella,M2);
		v = [posJi-posJEi,posJj-posJEj];
		D(j) = exp(-((norm(v,2))^2)/(2*sigma^2));
	end

function [i,j] = P(a,M2)
	i = fix(a/M2);
	j = mod(a,M2);

function [deltaW] = calculoDeltaW(learningRate, D, resta)
	for i = 1:size(resta,1)
		for j = 1:size(resta,2)
			deltaW(i,j) = learningRate * D(j) * resta(i,j);
		end
	end