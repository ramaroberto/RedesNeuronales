function [ep_errors, final_error] = ejCancerTraining(training_filename, hlayers, mode, output_filename)

    % El archivo tiene un string al pricipio, por lo que no puedo utilizar
    % csvopen. Cada fila tiene 1 string (%s) y 30 floats (%f).
    fid = fopen(training_filename);
    out = textscan(fid,'%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f','delimiter',',');
    fclose(fid);
    
    % Cargo la primera fila, que es la clasificacion, en zs, y traduzco a
    % valores bipolares.
    zs = zeros(length(out{1}), 1);
    for i = 1:length(out{1})
        if strcmp(out{1}(i), 'B')
            zs(i) = 1;
        else
            zs(i) = -1;
        end
    end
    
    % Con el resto armo la matriz xs.
    xs = [];
    for i = 2:length(out)
        xs = [xs out{i}];
    end
    
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