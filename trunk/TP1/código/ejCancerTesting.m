function [validation_error, validation] = ejCancerTesting(testing_filename, input_filename)
    
    % Se usa solamente en el dataset de cancer
    bipolar = true;
    % Lectura de entrada y salida
    [xs zs] = read(training_filename, bipolar);
    
    % Filtrado y normalizacion de los datos de entrada
    xs = normalizar(xs);
    
    % Creacion y entrenamiento de la neuronal network
    mp = MyMultiPerceptron(arq, 0.10, mode);
    mp.weights = weights;
    
    % Evaluacion de los datos de testing
    error = 0;
    validation = [];
    for i = 1:size(xs, 1)
        validation = [validation; zs(i,:) mp.feedForward(xs(i,:))];
        error = error + norm(zs(i,:)-mp.feedForward(xs(i,:)));
    end
    validation_error = error / size(xs, 1);
    
end