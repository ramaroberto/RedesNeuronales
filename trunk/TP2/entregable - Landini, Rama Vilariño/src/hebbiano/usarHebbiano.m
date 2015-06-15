% criterioParada es 'p' o 'o' segun se quiera corte por delta pesos u ortogonalidad
% regla es 's' o 'M' segun se quiera usar Sanger u Oja (M)
% learningRate es el valor de learningRate a usar
% alpha es el valor en la formula learningRate = epoca^(-alpha) para actualizar el learning rate. Si alpha es 0 entonces esa formula no se usa
% calcularPesos es un bool que cuando es true indica que se calcule la matriz de pesos mientras que cuando es false indica que se lea una matriz ya creada
% cantEpocas es la cantidad de epocas maxima que se admite (para tener otro criterio de corte)
% trainFilename es el nombre (path completo) del archivo donde estan las instancias de entrenamiento
% testFilename es el nombre (path completo) del archivo donde estan las instancias de validacion
% weightsFilename es el nombre (path completo) del archivo donde se guardara (o desde donde se leera si calcularPesos=false) la matriz de pesos
% datosFilename es el nombre del archivo donde se escribira la informacion sobre la corrida
% figureFilename es el nombre del .fig que se creara con el grafico de las instancias
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
		[weights, razon, epocaOError] = hebbianMatricial(trainInput, 3, criterioParada, regla, cantEpocas, learningRate, alpha);
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

	colores = [	[1 0 1];		% magenta
				[0 1 1];		% cian
				[1 0 0];		% rojo
				[0 1 0];		% verde
				[0 0 1];		% azul
				[1 1 0];		% amarillo
				[0.5 0.5 0];	% marrón
				[0.5 0 0.5];	% violeta
				[0 0.5 0.5]];	% azul oscuro

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