% Hacer cd hacia el directorio código

		modo = 'binary-regresion';
		max_error = 0.1;
		gamma = 0.1;
		dataset = 2;

    if matlabpool('size') ~= 0
        matlabpool close;
    end
    if matlabpool('size') == 0 % checking to see if my pool is already open
        matlabpool open 4; %% Cantidad de cores a correr
    end


parfor f = 1:4
%for f = 1:1
	f
	for max_epocas = 1000:500:3000
%	for max_epocas = 100
		test_error_filename = ['../resultados/dataset' num2str(dataset) '/binary-regresion_0.1/test' num2str(dataset) '_error' num2str(f) '.txt'];
		for neurons1 = 10:5:30
%		for neurons1 = 5			
			neurons1
			
			train_filename = ['../partitions/dataset' num2str(dataset) '/primerosFolds/train_fold' num2str(f) '_dataset' num2str(dataset) '.txt'];
			test_filename = ['../partitions/dataset' num2str(dataset) '/primerosFolds/test_fold' num2str(f) '_dataset' num2str(dataset) '.txt'];
			weights_filename = ['../resultados/dataset' num2str(dataset) '/binary-regresion_0.1/pesos_fold' num2str(f) '_' num2str(neurons1) '_' num2str(modo) '_' num2str(max_epocas) '_' num2str(max_error) '.txt'];
			plot_filename = ['../resultados/dataset' num2str(dataset) '/binary-regresion_0.1/error_fold' num2str(f) '_' num2str(neurons1) '_' num2str(modo) '_' num2str(max_epocas) '_' num2str(max_error) '.pdf'];
			training(train_filename,[neurons1],modo,weights_filename,max_epocas,max_error,gamma,plot_filename);
			error = testing(test_filename,weights_filename,gamma);
			fid = fopen(test_error_filename, 'a');
			fprintf(fid, ['fold' num2str(f) '_' num2str(neurons1) '_' num2str(modo) '_' num2str(max_epocas) '_' num2str(max_error) '\t' num2str(error) '\n']);
			fclose(fid);
		end
	end
end


	matlabpool close;