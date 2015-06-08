function [weights, epoca] = main(learningRate, sigma, autoajuste, M1, M2, calcularPesos, cantEpocas, trainFilename, testFilename, weightsFilename, figureTrainFilename, figureTestFilename, datosFilename)
	trainInput = csvread(trainFilename, 0, 1);
	train = csvread(trainFilename, 0, 0);
	testInput = csvread(testFilename, 0, 1);
	test = csvread(testFilename, 0, 0);

	if calcularPesos
		[weights] = som( trainInput, M1, M2, cantEpocas, learningRate, sigma, autoajuste );
		csvwrite(weightsFilename,weights);
	else
		weights = csvread(weightsFilename);
	end
	fileID = fopen(datosFilename,'a');
	fprintf(fileID,'learningRate: %f \t sigma: %f \t autoajuste: %d \t M1,M2: %d \n', learningRate, sigma, autoajuste, M1, M2);
	fclose(fileID);

	trainActivados = aplicarPesos(weights,train,M1,M2);
	testActivados = aplicarPesos(weights,test,M1,M2);
	
	h = imagesc(trainActivados);
	axis square;
	caxis([0 9]);
	colormap(jet(10));
	colorbar;
	saveas(h,figureTrainFilename,'fig');

	h = imagesc(testActivados);
	axis square;
	caxis([0 9]);
	colormap(jet(10));
	colorbar;
	saveas(h,figureTestFilename,'fig');