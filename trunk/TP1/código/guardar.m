% Guarda con la siguiente estructura
% cantidad_de_capas cantidad_de_atributos cantidad_de_salida cantidad_de_matrices_weight
% string_modo
% cantidad de neuronas (sin bias) en cada capa oculta
% por cada peso se escribe la matriz respetando las filas y separando los elementos con espacios. Una abajo de la otra
function [] = guardar(fileName, inputSize, layers, outputSize, weights, modo)
	fileID = fopen(fileName,'w');
	fprintf(fileID, '%d ', length(layers));
	fprintf(fileID, '%d ', inputSize);
	fprintf(fileID, '%d ', outputSize);
	fprintf(fileID, '%d ', length(weights));
	fprintf(fileID, '\n');
	fprintf(fileID, '%s', modo);
	fprintf(fileID, '\n');

	% Guardar todos los valores de las capas ocultas
	for i = 1:length(layers)
		fprintf(fileID, '%d ',layers(i));
	end
	fprintf(fileID, '\n');

	for c = 1:length(weights)
		for i = 1:size(weights{c},1)
			for j = 1:size(weights{c},2)
				fprintf(fileID, '%.10f ', weights{c}(i,j));
			end
			fprintf(fileID,'\n');
		end
	end
	fclose(fileID);