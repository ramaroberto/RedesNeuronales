function aplicarMetricas()
	learningRate = 1;
	sigma = 2;
    repeticion = 1;
    cantEpocas = 300;
    cantFolds = 9;
    autoajuste = true;

    for M1 = [15]
    %for M1 = [5]
        M1
        rel_dist_favg = 0; 
        avg_dist_favg = 0;
        rel_dist_man_favg = 0; 
        avg_dist_man_favg = 0; 
        sharing_factor_favg = 0;
        for fold = 1:cantFolds
            fold
            M2 = M1;

                trainFilename = ['../particiones/train_fold' num2str(fold) '.csv'];
                testFilename = ['../particiones/test_fold' num2str(fold) '.csv'];
                weightsFilename = ['../weights_kohonen_15/kohonen_fold' num2str(fold) '_cantEpocas' num2str(cantEpocas) '_autoajuste' num2str(autoajuste) '_M1' num2str(M1) '_learningRate' num2str(learningRate) '_sigma' num2str(sigma) '_rep' num2str(repeticion) '.csv'];

                train = csvread(trainFilename, 0, 0);
                test = csvread(testFilename, 0, 0);

                weights = csvread(weightsFilename);

                [trainActivados, trainCounts] = aplicarPesos(weights,train,M1,M2);
                [testActivados, ~] = aplicarPesos(weights,test,M1,M2);

                [rel_dist, avg_dist, ~] = distanceToDominants(trainActivados, testActivados, false);
                [rel_dist_man, avg_dist_man, ~] = distanceToDominants(trainActivados, testActivados, true);
                [sharing_factor, ~] = getSharingFactor(trainCounts);
                
                % Sumamos para promediar
                rel_dist_favg = rel_dist_favg + rel_dist;
                avg_dist_favg = avg_dist_favg + avg_dist;
                rel_dist_man_favg = rel_dist_man_favg + rel_dist_man; 
                avg_dist_man_favg = avg_dist_man_favg + avg_dist_man; 
                sharing_factor_favg = sharing_factor_favg + sharing_factor;
        end
        
        % Promediamos
        rel_dist_favg = rel_dist_favg / cantFolds;
        avg_dist_favg = avg_dist_favg / cantFolds;
        rel_dist_man_favg = rel_dist_man_favg / cantFolds;
        avg_dist_man_favg = avg_dist_man_favg / cantFolds;
        sharing_factor_favg = sharing_factor_favg / cantFolds;
        
        % Guardar datos de las metricas
        datosMetricasFilename = ['datosMetricasKohonen.txt'];
        fileID = fopen(datosMetricasFilename,'a');
            fprintf(fileID,'M1,M2: %d \t fold: %d \t rel_dist: %.3f \t avg_dist %.3f \t rel_dist_m: %.3f \t avg_dist_m: %.3f \t sharing: %.3f \n', M1, fold, rel_dist_favg, avg_dist_favg, rel_dist_man_favg, avg_dist_man_favg, sharing_factor_favg);
        fclose(fileID);
    end