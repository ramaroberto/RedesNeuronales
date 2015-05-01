function error = testing(testing_filename, input_filename)
    
    % Se usa solamente en el dataset de cancer
    bipolar = true;
    % Lectura de entrada y salida
    [xs zs] = read(training_filename, bipolar);
    
    % Filtrado y normalizacion de los datos de entrada
    xs = normalizar(xs);
    
    % Cargo parametros de la red
    [input, hlayers, output, weights, mode] = cargar(input_filename);
    arq = [input hlayers output];
    
    % Creacion y entrenamiento de la neuronal network
    mp = MyMultiPerceptron(arq, 0.10, mode);
    mp.weights = weights;
    
    % Evaluacion de los datos de testing
    error = 0;
    for i = size(xs, 1)
        error = error + norm(zs(i,:)-mp.feedForward(xs(i,:)));
    end
    error = error / size(xs, 1);
    
end