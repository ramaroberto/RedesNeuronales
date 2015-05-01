function [ep_errors, final_error] = training(training_filename, hlayers, mode, output_filename)

    % Se usa solamente en el dataset de cancer
    bipolar = true;
    % Lectura de entrada y salida
    [xs zs] = read(training_filename, true);
    
    % Filtrado y normalizacion de los datos de entrada
    xs = normalizar(xs);
    
    % Fijo parametros de la red
    input = size(xs, 2);
    output = size(zs, 2);
    arq = [input hlayers output];
    gamma = 0.10; % Learning rate
    epochs = 1;
    max_error = 0;
    
    % Creacion y entrenamiento de la neuronal network
    mp = MyMultiPerceptron(arq, gamma, mode);
    [ep_errors, final_error] = mp.train(xs, zs, max_error, epochs);
    
    % Guardado del estado de la misma
    guardar(output_filename, input, cell2num(hlayers), output, mp.weights, mode)
    
end