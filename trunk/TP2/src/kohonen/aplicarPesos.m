function [activados] = aplicarPesos(weights, input, M1, M2)
	cantidades = zeros(M1,M2,9);
	activados = zeros(M1,M2);
	for instancia = 1:size(input,1)
		res = input(instancia,2:end)*weights;
		for i = 0:M1-1
			for j = 1:M2
				if res(i*M2+j) > 0.5
					cantidades(i+1,j,input(instancia,1)) = cantidades(i+1,j,input(instancia,1))+1;
				end
			end
		end
	end
	% Buscar la dominante en cada posicion
	for i = 1:M1
		for j = 1:M2
			[val,index] = max(cantidades(i,j,:));
			activados(i,j) = index;
		end
	end