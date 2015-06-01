function [weights, razon, epocaOError] = main(calcularPesos, cantEpocas, cantFolds)
	criterioParada = 'ortog';
	regla = 'sg';
	learningRate = 0.001;
	alpha = 0;

	%for criterioParada = ['ortog','pesos']
		%for regla = ['o1','sg','oM']
			for fold = 1:cantFolds
				trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
				testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
				weightsFilename = ['../particiones/weights_fold' num2str(fold) '.csv'];
				figureFilename = ['graphs/fold' num2str(fold) '.fig'];

				trainInput = csvread(trainFilename, 0, 1);
				[trainInput,media] = normalizarEntrada(trainInput,false,0);
				testInput = csvread(testFilename, 0, 1);
				[testInput,media] = normalizarEntrada(testInput,true,media);
				
				if calcularPesos
					[weights, razon, epocaOError] = hebbian(trainInput, 3, criterioParada, regla, cantEpocas, learningRate, alpha);
					csvwrite(weightsFilename,weights);
				else
					weights = csvread(weightsFilename);
				end

				trainProcesado = aplicarPesos(weights,trainInput);
				testProcesado = aplicarPesos(weights,testInput);
				
				resTrain = csvread(trainFilename, 0, 0, [0 0 800-1 0]);
				resTest = csvread(testFilename, 0, 0, [0 0 100-1 0]);
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
		    
				h=figure('visible','off');
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
			end
		%end
	%end