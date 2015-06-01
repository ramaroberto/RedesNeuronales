function [weights, razon, epoca] = main(calcularPesos, cantEpocas, cantFolds)
	criterioParada = 'ortog';
	regla = 'sg';
	learningRate = 0.001;
	alpha = 0;

	for fold = 1:cantFolds
		trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
		testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
		weightsFilename = ['../particiones/weights_fold' num2str(fold) '.csv'];

		trainInput = csvread(trainFilename, 0, 1);
		[trainInput,media] = normalizarEntrada(trainInput,false,0);
		testInput = csvread(testFilename, 0, 1);
		[testInput,media] = normalizarEntrada(testInput,true,media);
		
		if calcularPesos
			[weights, razon, epoca] = hebbian(trainInput, 3, criterioParada, regla, cantEpocas, learningRate, alpha);
			csvwrite(weightsFilename,weights);
		else
			weights = csvread(weightsFilename);
		end

		trainProcesado = aplicarPesos(weights,trainInput);
		testProcesado = aplicarPesos(weights,testInput);

		%groupTrain = kmeans(trainProcesado,9);
		%groupTest = kmeans(testProcesado,9);
		group = kmeans([trainProcesado;testProcesado],9);

		colores = [	[0.6064 0.8836 0.6616];
					[0.0461 0.0957 0.7035];
					[0.7035 0.0517 0.2377];
					[0.5765 0.6238 0.2762];
					[0.8070 0.8279 0.2613];
					[0.6060 0.9225 0.4304];
					[0.6421 0.4565 0.9489];
					[0.7437 0.3503 0.0518];
					[0.9689 0.3634 0.7387]];
    
		for idx = 1:9
			c=1;
			for i = 1:size(trainProcesado,1)
				if group(i) == idx
					dataTrain(c,:) = trainProcesado(i,:);
					c=c+1;
				end
			end
		    scatter3(dataTrain(:,1), dataTrain(:,2), dataTrain(:,3), [], colores(idx,:), 'o', 'filled');
		    hold on;

		    c=1;
		    for i = 1:size(testProcesado,1)
				if group(i+size(trainProcesado,1)) == idx
					dataTest(c,:) = testProcesado(i,:);
					c=c+1;
				end
			end
		    scatter3(dataTest(:,1), dataTest(:,2), dataTest(:,3), [], colores(idx,:), 's', 'filled');
		    hold on;
		end
		grid on; 

	end