function [yMonio] = resta(xt, w)
	%for j = 1:size(w,2)
	%	yMonio(j) = norm(xt-w(:,j),2);
    %end
    
    %reescritura matricial
    yMonio = sqrt(sum((xt*ones(1, size(w,2))-w).^2,1));