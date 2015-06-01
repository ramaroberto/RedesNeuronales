function [Y,media] = normalizarEntrada( X, calcularla, mediaConocida )
	if calcularla
		suma = 0*[1:size(X,2)];
		for i = 1:size(X,1)
			suma = suma + X(i,:);
		end
		media = suma/size(X,1);
	else
		media = mediaConocida;
	end	

	for i = 1:size(X,1)
		Y(i,:) = X(i,:) - media;
	end