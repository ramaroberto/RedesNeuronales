function [weights] = usarKohonen(learningRate, sigma, autoajuste, M1, M2, calcularPesos, cantEpocas, trainFilename, testFilename, weightsFilename, figureTrainFilename, figureTestFilename, datosFilename)
	trainInput = csvread(trainFilename, 0, 1);
	train = csvread(trainFilename, 0, 0);
	test = csvread(testFilename, 0, 0);

	if calcularPesos
		[weights] = som( trainInput, M1, M2, cantEpocas, learningRate, sigma, autoajuste, false );
		csvwrite(weightsFilename,weights);
	else
		weights = csvread(weightsFilename);
    end

	[trainActivados, counts] = aplicarPesos(weights,train,M1,M2);
	[testActivados, ~] = aplicarPesos(weights,test,M1,M2);
    
    [rel_dist, avg_dist, ~] = distanceToDominants(trainActivados, testActivados, false);
    [rel_dist_man, avg_dist_man, ~] = distanceToDominants(trainActivados, testActivados, true);
    [sharing_factor, ~] = getSharingFactor(counts);
    
    fileID = fopen(datosFilename,'a');
	fprintf(fileID,'learningRate: %f \t sigma: %f \t autoajuste: %d \t M1,M2: %d \t rel_dist: %.3f \t avg_dist %.3f \t rel_dist_m: %.3f \t avg_dist_m: %.3f \t sharing: %.3f \n', learningRate, sigma, autoajuste, M1, M2, rel_dist, avg_dist, rel_dist_man, avg_dist_man, sharing_factor);
	fclose(fileID);
	
	h = imagesc(trainActivados);
	axis square;
	caxis([0 9]);
	colormap(jet(10));
	colorbar;
	saveas(h,figureTrainFilename,'fig');

	g = imagesc(testActivados);
	axis square;
	caxis([0 9]);
	colormap(jet(10));
	colorbar;
	saveas(g,figureTestFilename,'fig');