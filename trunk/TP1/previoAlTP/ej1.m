valores='bin'; % 'bin' o 'bip'
cantEntrada=2; % 2 o 3 o 4 o 6
    

maxEpochs=1000;
epsilon=0.01;
error=999;


h=1;
if valores=='bin'
	l=0;
elseif valores=='bip'
	l=-1;
end

% Posiciones de 1 a 6 (izquierda la mas baja)
entrada = [	[l,l,l,l,l,l];
			[h,l,l,l,l,l];
			[l,h,l,l,l,l];
			[h,h,l,l,l,l];
			[l,l,h,l,l,l];
			[h,l,h,l,l,l];
			[l,h,h,l,l,l];
			[h,h,h,l,l,l];
			[l,l,l,h,l,l];
			[h,l,l,h,l,l];
			[l,h,l,h,l,l];
			[h,h,l,h,l,l];
			[l,l,h,h,l,l];
			[h,l,h,h,l,l];
			[l,h,h,h,l,l];
			[h,h,h,h,l,l];
			[l,l,l,l,h,l];
			[h,l,l,l,h,l];
			[l,h,l,l,h,l];
			[h,h,l,l,h,l];
			[l,l,h,l,h,l];
			[h,l,h,l,h,l];
			[l,h,h,l,h,l];
			[h,h,h,l,h,l];
			[l,l,l,h,h,l];
			[h,l,l,h,h,l];
			[l,h,l,h,h,l];
			[h,h,l,h,h,l];
			[l,l,h,h,h,l];
			[h,l,h,h,h,l];
			[l,h,h,h,h,l];
			[h,h,h,h,h,l];
			[l,l,l,l,l,h];
			[h,l,l,l,l,h];
			[l,h,l,l,l,h];
			[h,h,l,l,l,h];
			[l,l,h,l,l,h];
			[h,l,h,l,l,h];
			[l,h,h,l,l,h];
			[h,h,h,l,l,h];
			[l,l,l,h,l,h];
			[h,l,l,h,l,h];
			[l,h,l,h,l,h];
			[h,h,l,h,l,h];
			[l,l,h,h,l,h];
			[h,l,h,h,l,h];
			[l,h,h,h,l,h];
			[h,h,h,h,l,h];
			[l,l,l,l,h,h];
			[h,l,l,l,h,h];
			[l,h,l,l,h,h];
			[h,h,l,l,h,h];
			[l,l,h,l,h,h];
			[h,l,h,l,h,h];
			[l,h,h,l,h,h];
			[h,h,h,l,h,h];
			[l,l,l,h,h,h];
			[h,l,l,h,h,h];
			[l,h,l,h,h,h];
			[h,h,l,h,h,h];
			[l,l,h,h,h,h];
			[h,l,h,h,h,h];
			[l,h,h,h,h,h];
			[h,h,h,h,h,h];
			];

salida = 	[l;h;h;l;
			l;h;h;l;h;l;l;h;
			l;h;h;l;h;l;l;h;h;l;l;h;l;h;h;l;
			l;h;h;l;h;l;l;h;h;l;l;h;l;h;h;l;h;l;l;h;l;h;h;l;l;h;h;l;h;l;l;h;
			l;h;h;l;h;l;l;h;h;l;l;h;l;h;h;l;h;l;l;h;l;h;h;l;l;h;h;l;h;l;l;h;h;l;l;h;l;h;h;l;l;h;h;l;h;l;l;h;l;h;h;l;h;l;l;h;l;h;h;l;h;l;l;h];

input = entrada(1:2^cantEntrada,1:cantEntrada);
output = salida(1:2^cantEntrada,1,1);


andorEntrada = [[l,l];[l,h];[h,l];[h,h]]; %% AND + OR
andorSalida = [[l,l];[l,h];[l,h];[h,h]]; %% AND + OR


%capas = [cantEntrada, cantEnCapaOculta];
%[e,t,W_list] = learning(input, output, epsilon, maxEpochs, capas);
%e
%t

%for i = 1:size(input,1)
%	input(i,:)
%	Y = activation(input(i,:), W_list);
%	Y{3}
%	output(i)
%end


capas = [];
[e,t,W_list] = learning(andorEntrada,andorSalida,epsilon,maxEpochs,capas);
e
t

for i = 1:size(andorEntrada,1)
	andorEntrada(i,:);
	Y = activation(andorEntrada(i,:), W_list);
	Y{size(Y,2)}
	andorSalida(i,:)
end