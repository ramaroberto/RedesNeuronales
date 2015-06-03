function [activados] = aplicarPesos(weights, input, M1, M2)
	cantidades = zeros(M1,M2,9);
	activados = zeros(M1,M2);
	for instancia = 1:size(input,1)
		jEstrella = activar(input(instancia,2:end), weights);
		if jEstrella == M1*M2
			cantidades(M1,M2,input(instancia,1)) = cantidades(M1,M2,input(instancia,1))+1;	
		else
			jEstrellaI = idivide(uint8(jEstrella),uint8(M2),'floor');
			jEstrellaJ = mod(jEstrella,M2);
			cantidades(jEstrellaI+1,jEstrellaJ+1,input(instancia,1)) = cantidades(jEstrellaI+1,jEstrellaJ+1,input(instancia,1))+1;
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