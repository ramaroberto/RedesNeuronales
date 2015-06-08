function [weights, razon, epocaOError] = usarHebbiano(criterioParada, regla, learningRate, alpha, calcularPesos, cantEpocas, trainFilename, testFilename, weightsFilename, datosFilename, figureFilename)
	
	trainInput = csvread(trainFilename, 0, 1);
	[trainInput,media] = normalizarEntrada(trainInput,false,0);
	[status, result] = system( ['wc -l ', trainFilename] );
	numberTrain = result(1:3);

	testInput = csvread(testFilename, 0, 1);
	[testInput,media] = normalizarEntrada(testInput,true,media);
	[status, result] = system( ['wc -l ', testFilename] );
	numberTest = result(1:3);
	
	if calcularPesos
		[weights, razon, epocaOError] = hebbian(trainInput, 3, criterioParada, regla, cantEpocas, learningRate, alpha);
		csvwrite(weightsFilename,weights);
	else
		weights = csvread(weightsFilename);
	end
	fileID = fopen(datosFilename,'a');
	fprintf(fileID,'criterioParada: %s \t regla: %s \t cantEpocas: %d \t razon: %s \t epocaOError: %f \n', criterioParada, regla, cantEpocas, razon, epocaOError);
	fclose(fileID);

	trainProcesado = aplicarPesos(weights,trainInput);
	testProcesado = aplicarPesos(weights,testInput);
	
	resTrain = csvread(trainFilename, 0, 0, [0 0 numberTrain-1 0]);
	resTest = csvread(testFilename, 0, 0, [0 0 numberTest-1 0]);
	group = [resTrain;resTest];

	colores = [	[1 0 1];
				[0 1 1];
				[1 0 0];
				[0 1 0];
				[0 0 1];
				[1 1 0];
				[0.5 0.5 0];
				[0.5 0 0.5];
				[0 0.5 0.5]];

	h=figure('visible','on');
	for idx = 1:9
		c=1;
		for i = 1:size(trainProcesado,1)
			if group(i) == idx
				dataTrain(c,:) = trainProcesado(i,:);
				c=c+1;
			end
		end
	    scatter3(dataTrain(:,1), dataTrain(:,2), dataTrain(:,3), [], colores(idx,:), 'o');
	    hold on;

	    c=1;
	    for i = 1:size(testProcesado,1)
			if group(i+size(trainProcesado,1)) == idx
				dataTest(c,:) = testProcesado(i,:);
				c=c+1;
			end
		end
	    scatter3(dataTest(:,1), dataTest(:,2), dataTest(:,3), [], colores(idx,:), 'v');
	    hold on;
	end
	grid on; 
	saveas(h,figureFilename,'fig');