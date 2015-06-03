% Se le pasa el nombre del dataset, la cantidad de folds y el 
% directorio donde se quiere que cree los archivos.
% Va a crear dataset1_test_fold{i}.csv y dataset1_train_fold{i}.csv
% para cada fold i y lo mismo para el dataset2 si fileName es ese.
% EJEMPLO
% filename = 'tp2_training_dataset.csv';
% outDir = 'particiones/';
% folds = 10;
% crearParticiones(filename, folds, outDir);
function [] = crearParticiones(fileName, folds, outDir)
	[status, result] = system( ['wc -l ', fileName] );
	number = result(1:3);
    numlines = str2num(number);

	partition = cvpartition(numlines,'KFold',folds);

	for fold = 1:partition.NumTestSets
		outNameTrain = [outDir 'train_fold' num2str(fold) '.csv'];
		outNameTest = [outDir 'test_fold' num2str(fold) '.csv'];
		fidTrain = fopen(outNameTrain,'w');
		fidTest = fopen(outNameTest,'w');
		i = 1;
		fid = fopen(fileName,'r');
		p = partition.training(fold);
		while ~feof(fid)
			line = fgets(fid);
			if p(i) == 1 % Train
				fprintf(fidTrain, line);
			else % Test
				fprintf(fidTest, line);
			end
			i = i + 1;
		end
		fclose(fidTrain);
		fclose(fidTest);
	end