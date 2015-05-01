% Se le pasa el nombre del dataset, la cantidad de folds y el 
% directorio donde se quiere que cree los archivos.
% Va a crear dataset1_test_fold{i}.txt y dataset1_train_fold{i}.txt
% para cada fold i y lo mismo para el dataset2 si fileName es ese.
% EJEMPLO
% filename = '../RNA_15C1_TP1_Entrenamiento/tp1_training_dataset_1.csv';
% outDir = '../partitions/';
% folds = 10;
% crearParticiones(filename, folds, outDir);
function [] = crearParticiones(fileName, folds, outDir)
	[status, result] = system( ['wc -l ', fileName] );
	number = result(1:3);
    numlines = str2num(number)-1;

	partition = cvpartition(numlines,'KFold',folds);

	for fold = 1:partition.NumTestSets
		outNameTrain = [outDir 'dataset' fileName(length(fileName)-4) '_train_fold' num2str(fold) '.txt'];
		outNameTest = [outDir 'dataset' fileName(length(fileName)-4) '_test_fold' num2str(fold) '.txt'];
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