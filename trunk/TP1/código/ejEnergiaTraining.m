function [ep_errors, final_error] = ejEnergiaTraining(training_filename, hlayers, mode, output_filename)

    % Cargado de datos desde el archivo
    out = csvread(training_filename);
    zs = out(:,9:10);
	xs = out(:, 1:8);
    
    % Filtrado y normalizacion de los datos de entrada
    xs = normalizar(xs);
    
    % Fijo parametros de la red
    input = size(xs, 2);
    output = size(zs, 2);
    arq = [input hlayers output];
    gamma = 0.10; % Learning rate
    epochs = 10000;
    max_error = 0;
    
    % Creacion y entrenamiento de la neuronal network
    mp = MyMultiPerceptron(arq, gamma, mode);
    [ep_errors, final_error] = mp.train(xs, zs, max_error, epochs);
    
    % Guardado del estado de la misma
    guardar(output_filename, input, cell2num(hlayers), output, mp.weights, mode)
    
end