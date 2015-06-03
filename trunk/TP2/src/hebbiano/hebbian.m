function [weights, razon, epocaOError] = hebbian( dataset, cantNeuronas, criterioParada, regla, maxEpocas, learningRate, alpha )
	if criterioParada == 'p' % Por pesos
		criterio = true;
	elseif criterioParada == 'o' % Por ortogonalidad
		criterio = false;
	end

	% Setear parametros
	epsilon = 0.001;
	epoca = 0;
	sumaDeDeltas = 0;
	salir = false;
	weights = 0.1 * randn(size(dataset,2), cantNeuronas);
	M = cantNeuronas;
	N = size(dataset,2);

	% Entrenamiento
	while epoca < maxEpocas & ~salir
		epoca
		
		for d = [1:size(dataset,1)]
			deltaW = zeros(size(dataset,2), cantNeuronas);
			x = dataset(d,:);
			y = x*weights;
			for j = [1:M]
				xMonio = x-x;
				for i = [1:N]
					if regla == 'h'
						Q = 0;
					elseif regla == '1'
						Q = 1;
					elseif regla == 's'
						Q = j;
					elseif regla == 'M'
						Q = M;
					end

					for k = [1:Q]
						xMonio(i) = xMonio(i) + y(k)*weights(i,k);
					end
					deltaW(i,j) = learningRate * (x(i)-xMonio(i)) * y(j);
				end
			end
			
			weights = weights + deltaW;
			if alpha ~= 0
				learningRate = epoca^(-alpha);
			end
		end
		
		sumaDeDeltas = norm(deltaW,'fro');

		% Calcula el error y decide si hay que salir
		if criterio % O sea mirar el deltaW
			if sumaDeDeltas < epsilon
				salir = true;
				razon = 'deltaWMenorEpsilon';
				epocaOError = epoca;
			end
		else % O sea mirar si los vectores son bastante ortogonales
			j1 = 1;
			ningunoMayor = true;
			while ningunoMayor & j1 < size(weights,2)-1
				v1 = weights(:,j1);
				j2 = j1+1;
				while ningunoMayor & j2 < size(weights,2)
					v2 = weights(:,j2);
					if abs(v1'*v2) > epsilon
						ningunoMayor = false;
					end
					j2 = j2+1;
				end
				j1 = j1+1;
			end

			if ningunoMayor % O sea que son ortogonales segun epsilon
				salir = true;
				razon = 'ortogonalidad';
				epocaOError = epoca;
			end
		end

		epoca = epoca+1;
	end

	if ~salir
		razon = 'maxEpocas';
		epocaOError = sumaDeDeltas;
	end