function [weights, epoca] = main(calcularPesos, cantEpocas, cantFolds)
	learningRate = 1;
	sigma = 2;

	%for repeticion = 1:5
	for repeticion = 1:1
		%for autoajuste = [false,true]
		autoajuste = true;
			for fold = 1:cantFolds
				for M1 = 30
					for M2 = 20
						trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
						testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
						weightsFilename = ['../weights/kohonen_fold' num2str(fold) '_' num2str(cantEpocas) '_' num2str(learningRate) '_' num2str(sigma) '_rep' num2str(repeticion) '.csv'];
						figureFilename = ['graphs/fold' num2str(fold) '_' num2str(cantEpocas) '_' num2str(learningRate) '_' num2str(sigma) '_rep' num2str(repeticion) '.fig'];

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

						trainActivados = aplicarPesos(weights,train,M1,M2);
						testActivados = aplicarPesos(weights,test,M1,M2);
						
						h = imagesc(trainActivados);
						axis square;
						caxis([0 9]);
						colormap(jet(10));
						colorbar;
					end
				end
			end
		%end
	end