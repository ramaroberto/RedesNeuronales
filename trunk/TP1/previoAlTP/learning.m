function [ e, t, W_list ] = learning(X, Z, e_stop, t_stop, capas)
	% Capas incluye la cantidad de input, sin contar el bias (en ninguna capa)
    % Ej: capas = c(3,4), es una red que tiene una capa oculta intermedia de 3
    % neuronas (sin contar el bias) y otra capa oculta con 4
    e = 999;
    t = 0;

    % En todas las matrices de pesos siempre hay una fila más para considerar al bias
    if length(capas) == 0
    	W_list{1} = 0.1 * randn(size(X,2)+1, size(Z,2)); % En este caso relaciona directamente la entrada con la salida
    elseif length(capas) == 1
    	W_list{1} = 0.1 * randn(size(X,2)+1, capas(1)); % Relaciona la entrada con la única capa
    	W_list{2} = 0.1 * randn(capas(1)+1, size(Z,2)); % Relaciona la capa con la salida
    else
    	W_list{1} = 0.1 * randn(size(X,2)+1, capas(1)); % Relaciona la entrada con la primera capa
	    for i = 1:length(capas)-1
	    	W_list{1+i} = 0.1 * randn(capas(i)+1, capas(i+1)); % Relaciona cada capa con la siguiente
	    end
	    W_list{1+length(capas)} = 0.1 * randn(capas(length(capas))+1, size(Z,2)); % En el output usa la cantidad de salida
	end

    while e > e_stop & t < t_stop
    	[e, W_list, neuronas] = training(X, Z, W_list);
    	t = t + 1;
    end
end

function [ error, W_list, neuronas ] = training(entrada, salida, W_list)
	error = 0;
	for i = 1:size(W_list,2)
		delta_W_list{i} = zeros(size(W_list{i},1), size(W_list{i},2));
	end
	perm = randperm(size(entrada,2));
	%perm = [1:size(entrada,2)];
	for i = length(perm)
		neuronas = activation(entrada(perm(i),:), W_list);
		[e, delta_W_list] = correction(salida(perm(i),:), W_list, delta_W_list, neuronas);
		error = error + e;
	end
	W_list = adaptation(delta_W_list, W_list);
end

function [ Y ] = activation(X_h, W_list)
	Y{1} = X_h;
	l = size(W_list,2);
	for i = 1:l
		Y{i} = [Y{i}, -1]; % Agrega el bias
		Y{i+1} = f(Y{i} * W_list{i}); % Aplica f a cada posición del resultado de Y*W
	end
end

function [ e, delta_W_list ] = correction(Z_h, W_list, delta_W_list, Y)
	alpha = 0.2; % Learning rate
	L = size(W_list,2);
	E = Z_h - Y{L+1}; % Si L es la cantidad de matrices de pesos, hay L + 1 capas y la última es el resultado
	e = norm(E);

	for i = 1:L
		E = E .* fP(Y{L+1-i} * W_list{L+1-i});
		delta_W_list{L+1-i} = delta_W_list{L+1-i} + alpha * (Y{L+1-i}' * E);
		E = E * (W_list{L+1-i})';
		E = E(1:length(E)-1); % No tengo en cuenta el error del bias!
	end
end

function [ W_list ] = adaptation(delta_W_list, W_list)
	L = size(W_list,2);
	for i = 1:L
		W_list{i} = W_list{i} + delta_W_list{i};
		delta_W_list{i} = delta_W_list{i} .* 0; % Manda todo a cero
	end
end

function [ res ] = f(v)
	beta = 1; % Hardcodea el valor de beta
	res = v;
	for i = 1:length(v)
		res(i) = tanh(beta * v(i));
	end
end

function [ res ] = fP(v)
	beta = 1; % Hardcodea el valor de beta
	res = v;
	for i = 1:length(v)
		res(i) = beta * (1 - f(v(i))*f(v(i)));
	end
end
