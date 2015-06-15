function [activados, cantidades] = aplicarPesos(weights, input, M1, M2)
	cantidades = zeros(M1,M2,9);
	activados = zeros(M1,M2);
	for instancia = 1:size(input,1)
		jEstrella = activar(input(instancia,2:end), weights);
		if jEstrella == M1*M2
			cantidades(M1,M2,input(instancia,1)) = cantidades(M1,M2,input(instancia,1))+1;	
		else
			for itJE = 1:size(jEstrella)
				jEstrellaI = fix(jEstrella(itJE)/M2);
				jEstrellaJ = mod(jEstrella(itJE),M2);
				cantidades(jEstrellaI+1,jEstrellaJ+1,input(instancia,1)) = cantidades(jEstrellaI+1,jEstrellaJ+1,input(instancia,1))+1;
			end
		end
	end
	% Buscar la dominante en cada posicion
	for i = 1:M1
		for j = 1:M2
			[val,index] = max(cantidades(i,j,:));
			if val == 0
				activados(i,j) = 0;
			else	
				activados(i,j) = index;
			end
		end
	end

function [jEstrella] = activar(entrada, w)
	x = entrada;
	yMonio = resta(x',w);
	y = (yMonio == min(yMonio));
	jEstrella = find(y);