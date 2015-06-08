function main(cantEpocas, cantFolds)
	learningRate = 1;
	sigma = 2;

	for repeticion = 1:5
		for autoajuste = [false,true]
			for fold = 1:cantFolds
				for M1 = [10,30,50,100]
					M2 = M1;
                    
                    trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
                    testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
                    weightsFilename = ['../weights_kohonen/kohonen_fold' num2str(fold) '_' num2str(cantEpocas) '_' num2str(learningRate) '_' num2str(sigma) '_rep' num2str(repeticion) '.csv'];
                    datosMetricasFilename = ['graphs_robert/datosMetricasKohonen.txt'];
                    
                    train = csvread(trainFilename, 0, 0);
                    test = csvread(testFilename, 0, 0);

                    weights = csvread(weightsFilename);
                    
                    trainActivados = aplicarPesos(weights,train,M1,M2);
                    testActivados = aplicarPesos(weights,test,M1,M2);
                    
                    trainCounts = []; % hay que modificar aplicarPesos para obtener esto
                    
                    [rel_dist, avg_dist, dist_map] = distanceToDominants(trainActivados, testActivados, false);
                    [rel_dist_m, avg_dist_m, dist_map_m] = distanceToDominants(trainActivados, testActivados, true);
                    [sharing_factor, cross_count_matrix] = getSharingFactor(trainCounts);
                    
                    % Guardar datos de las metricas
                    fileID = fopen(datosFilename,'a');
						fprintf(fileID,'learningRate: %f \t sigma: %f \t autoajuste: %d \t M1,M2: %d \t fold: %d \t rep: %d \t rel_dist: %d \t avg_dist %d \t rel_dist_m: %d \t avg_dist_m: %d \t sharing: %d \n', learningRate, sigma, autoajuste, M1, fold, repeticion, rel_dist, avg_dist, rel_dist_m, avg_dist_m, sharing_factor);
                    fclose(fileID);
                    
                end
            end
        end
    end