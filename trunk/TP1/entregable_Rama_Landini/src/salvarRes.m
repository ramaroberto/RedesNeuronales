% Orden de los valores guardados:
% error_de_parada epocas_de_parada errpr_final epoca_final cant_inst_train cant_inst_test diferencia_en_test
% capas
% error_segun_epoca
function [] = salvarRes(fileName, e_stop, t_stop, capas, cantTrain, cantTest, e, t, difTotal, Error)
	fileID = fopen(fileName,'w');
	fprintf(fileID, '%.5f ', e_stop);
	fprintf(fileID, '%.5f ', t_stop);
	fprintf(fileID, '%.5f ', e);
	fprintf(fileID, '%.5f ', t);
	fprintf(fileID, '%d ', cantTrain);
	fprintf(fileID, '%d ', cantTest);
	fprintf(fileID, '%.5f ', difTotal);
	fprintf(fileID, '\n');

	for i = 1:length(capas)
		fprintf(fileID, '%d ', capas(i));
	end
	fprintf(fileID, '\n');

	for i = 1:length(Error)
		fprintf(fileID, '%d ', Error(i));
	end