function [activated] = activar(entrada, w)
	activated = zeros(1,size(w,2));
	for d = 1:size(entrada,1)
		x = entrada(d,:);
		yMonio = resta(x',w);
		y = (yMonio == min(yMonio));
		jEstrella = find(y);
		activated(jEstrella) = activated(jEstrella)+1;
	end