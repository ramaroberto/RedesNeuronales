function [validation_error, validation] = ejCancerTesting(testing_filename, input_filename)

    % El archivo tiene un string al pricipio, por lo que no puedo utilizar
    % csvopen. Cada fila tiene 1 string (%s) y 30 floats (%f).
    fid = fopen(testing_filename);
    out = textscan(fid,'%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f','delimiter',',');
    fclose(fid);
    
    % Cargo parametros de la red
    [input, hlayers, output, weights, mode] = cargar(input_filename);
    arq = [input hlayers output];
    mode = mode{1};
    
    % Modifico segun sea necesario
    hi = 1;
    low = -1;
    if strcmp('binary', mode)
        low = 0;
    end
    
    % Cargo la primera fila, que es la clasificacion, en zs, y traduzco a
    % valores bipolares.
    zs = zeros(length(out{1}), 1);
    for i = 1:length(out{1})
        if strcmp(out{1}(i), 'B')
            zs(i) = hi;
        else
            zs(i) = low;
        end
    end
    
    % Con el resto armo la matriz xs.
    xs = [];
    for i = 2:length(out)
        xs = [xs out{i}];
    end
    
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