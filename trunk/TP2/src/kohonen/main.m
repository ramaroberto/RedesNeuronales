function [weights, epoca] = main(calcularPesos, cantEpocas, cantFolds)
	for fold = 1:cantFolds
		trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
		testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
		weightsFilename = ['../weights/kohonen_fold' num2str(fold) '.csv'];
		figureFilename = ['graphs/fold' num2str(fold) '_' criterioParada '_' regla '_' num2str(alpha) '_rep' num2str(repeticion) '.fig'];

		trainInput = csvread(trainFilename, 0, 1);
		train = csvread(trainFilename, 0, 0);
		[trainInput,media] = normalizarEntrada(trainInput,false,0);
		testInput = csvread(testFilename, 0, 1);
		test = csvread(testFilename, 0, 0);
		[testInput,media] = normalizarEntrada(testInput,true,media);

		if calcularPesos
			[weights] = som( dataset, M1, M2, maxEpocas, learningRate, autoajuste, sigma )
			csvwrite(weightsFilename,weights);
		elseif 
			weights = csvread(weightsFilename);
		end

		trainActivados = aplicarPesos(weights,train,M1,M2);
		testActivados = aplicarPesos(weights,test,M1,M2);
		
		
	end