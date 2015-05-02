function [ep_errors, final_error] = training(training_filename, hlayers, mode, output_filename, epochs, max_error, graph_filename)

    % Se usa solamente en el dataset de cancer
    bipolar = false;
    % Lectura de entrada y salida
    [xs zs] = read(training_filename, bipolar);
    
    % Filtrado y normalizacion de los datos de entrada
    xs = normalizar(xs);
    
    % Fijo parametros de la red
    input = size(xs, 2);
    output = size(zs, 2);
    arq = [input hlayers output];
    gamma = 0.10; % Learning rate
    
    % Creacion y entrenamiento de la neuronal network
    mp = MyMultiPerceptron(arq, gamma, mode);
    [ep_errors final_error] = mp.train(xs, zs, max_error, epochs);
    
    % Guardado del estado de la misma
    guardar(output_filename, input, hlayers, output, mp.weights, mode);
    

    % Creacion de grafico con el error en funcion de la epoca
    set(0,'DefaultFigureVisible','off');
    fig = figure;
    plot([1:length(ep_errors)], ep_errors, 'b--o');
    title('Error en funcion de las epocas');
    xlabel('Epoca');
    ylabel('Error');
    set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
    set(gcf, 'PaperSize', [5 5]);
    saveas(fig, graph_filename);
end