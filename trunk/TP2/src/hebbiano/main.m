function [weights, razon, epocaOError] = main(calcularPesos, cantEpocas, cantFolds)
	%criterioParada = 'ortog';
	%regla = 'sg';
	learningRate = 0.001;
	alpha = 0;

	for repeticion = 1:1
		%for criterioParada = ['o','p']
		for criterioParada = ['p']
			for regla = ['s','M']
				for fold = 1:cantFolds
					trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
					testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
					weightsFilename = ['../weights/hebbiano_fold' num2str(fold) '_criterioParada' criterioParada '_regla' regla '_alpha' num2str(alpha) '_rep' num2str(repeticion) '.csv'];
					figureFilename = ['graphs/fold' num2str(fold) '_criterioParada' criterioParada '_regla' regla '_alpha' num2str(alpha) '_rep' num2str(repeticion) '.fig'];
					datosFilename = ['graphs/datosCorridasHebbiano.txt'];

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
					fileID = fopen(datosFilename,'a');
					fprintf(fileID,'criterioParada: %s \t regla: %s \t fold: %d \t rep: %d \t cantEpocas: %d \t razon: %s \t epocaOError: %f \n', criterioParada, regla, fold, repeticion, cantEpocas, razon, epocaOError);
					fclose(fileID);

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
			end
		end
	end