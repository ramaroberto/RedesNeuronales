function [] = guardar(fileName, inputSize, layers, outputSize, weights)
	fileID = fopen(fileName,'w');
	fprintf(fileID, '%d ', length(layers));
	fprintf(fileID, '%d ', inputSize);
	fprintf(fileID, '%d ', outputSize);
	fprintf(fileID, '%d ', length(weights));
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