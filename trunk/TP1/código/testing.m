function error = testing(testing_filename, input_filename)
    
    % Se usa solamente en el dataset de cancer
    bipolar = false;
    % Lectura de entrada y salida
    [xs zs] = read(testing_filename, bipolar);
    
    % Filtrado y normalizacion de los datos de entrada
    xs = normalizar(xs);
    
    % Cargo parametros de la red
    [input, hlayers, output, weights, mode] = cargar(input_filename);
    arq = [input hlayers output];
    gamma = 0.10; % Learning rate
    
    % Creacion y entrenamiento de la neuronal network
    mp = MyMultiPerceptron(arq, gamma, char(mode));
    mp.weights = weights;
    
    % Evaluacion de los datos de testing
    error = 0;
    for i = 1:size(xs, 1)
        error = error + norm(zs(i,:)-mp.feedForward(xs(i,:)));
    end
    error = error / size(xs, 1);
end