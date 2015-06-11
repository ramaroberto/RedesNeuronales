function [weights, epoca] = main(calcularPesos, cantEpocas, cantFolds)
	learningRate = 1;
	sigma = 2;

	for repeticion = 4:5
		for autoajuste = [false,true]
			for fold = 1:cantFolds
				for M1 = [10,30,50]
					M2 = M1;
					%for M2 = 20
						trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
						testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
						weightsFilename = ['../weights/kohonen_fold' num2str(fold) '_cantEpocas' num2str(cantEpocas) '_autoajuste' num2str(autoajuste) '_M1' num2str(M1) '_learningRate' num2str(learningRate) '_sigma' num2str(sigma) '_rep' num2str(repeticion) '.csv'];
						figureTrainFilename = ['graphs/trainfold' num2str(fold) '_cantEpocas' num2str(cantEpocas) '_autoajuste' num2str(autoajuste) '_M1' num2str(M1) '_learningRate' num2str(learningRate) '_sigma' num2str(sigma) '_rep' num2str(repeticion) '.fig'];
						figureTestFilename = ['graphs/testfold' num2str(fold) '_cantEpocas' num2str(cantEpocas) '_autoajuste' num2str(autoajuste) '_M1' num2str(M1) '_learningRate' num2str(learningRate) '_sigma' num2str(sigma) '_rep' num2str(repeticion) '.fig'];
						datosFilename = ['graphs/datosCorridasKohonen.txt'];

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
						fprintf(fileID,'learningRate: %f \t sigma: %f \t autoajuste: %d \t cantEpocas: %d \t M1,M2: %d \t fold: %d \t rep: %d \n', learningRate, sigma, autoajuste, cantEpocas, M1, fold, repeticion);
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
					%end
				end
			end
		end
	end