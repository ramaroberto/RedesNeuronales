function [activados] = aplicarPesos(weights, input, M1, M2)
	cantidades = zeros(M1,M2,9);
	activados = zeros(M1,M2);
	for instancia = 1:size(input,1)
		for i = 0:M1-1
			for j = 1:M2
				jEstrella = activar(input(instancia,2:end), weights);
				jEstrellaI = idivide(uint8(jEstrella),uint8(M1));
				jEstrellaJ = mod(jEstrella,M2);
				cantidades(jEstrellaI+1,jEstrellaJ+1,input(instancia,1)) = cantidades(jEstrellaI+1,jEstrellaJ+1,input(instancia,1))+1;
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

function [jEstrella] = activar(entrada, w)
	x = entrada;
	yMonio = resta(x',w);
	y = (yMonio == min(yMonio));
	jEstrella = find(y);