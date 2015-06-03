function [weights, epoca] = main(calcularPesos, cantEpocas, cantFolds)
	learningRate = 0.001;
	alpha = 0;
	sigma = 1;

	%for repeticion = 1:5
	for repeticion = 1:1
		for fold = 1:cantFolds
			for M1 = 30
				for M2 = 30
					trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
					testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
					weightsFilename = ['../weights/kohonen_fold' num2str(fold) '_' num2str(cantEpocas) '_' num2str(learningRate) '_' num2str(alpha) '_' num2str(sigma) '_rep' num2str(repeticion) '.csv'];
					figureFilename = ['graphs/fold' num2str(fold) '_' num2str(cantEpocas) '_' num2str(learningRate) '_' num2str(alpha) '_' num2str(sigma) '_rep' num2str(repeticion) '.fig'];

					trainInput = csvread(trainFilename, 0, 1);
					train = csvread(trainFilename, 0, 0);
					testInput = csvread(testFilename, 0, 1);
					test = csvread(testFilename, 0, 0);

					if calcularPesos
						[weights] = som( trainInput, M1, M2, cantEpocas, learningRate, alpha, sigma );
						csvwrite(weightsFilename,weights);
					else
						weights = csvread(weightsFilename);
					end

					trainActivados = aplicarPesos(weights,train,M1,M2);
					testActivados = aplicarPesos(weights,test,M1,M2);
					
					h = imagesc(trainActivados);
					axis square;
					caxis([1 9]);
					colormap(jet(9));
					colorbar;
				end
			end
		end
	end