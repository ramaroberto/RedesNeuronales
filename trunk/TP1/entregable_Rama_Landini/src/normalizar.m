function [ Moutput ] = normalizar(Minput)
	for j = 1:size(Minput,2)
		avg = mean(Minput(:,j));
		stddv = std(Minput(:,j));
		Moutput(:,j) = (Minput(:,j) - avg)/stddv;
	end