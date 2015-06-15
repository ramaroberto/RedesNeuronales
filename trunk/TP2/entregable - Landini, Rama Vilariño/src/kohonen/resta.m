function [yMonio] = resta(xt, w)
    yMonio = sum((xt*ones(1, size(w,2))-w).^2);