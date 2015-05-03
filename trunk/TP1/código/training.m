function [ep_errors, final_error] = training(training_filename, hlayers, mode, output_filename, epochs, max_error, gamma, graph_filename)

    % Se usa solamente en el dataset de cancer
    bipolar = false;

    % Para saber qué rango usar en el gráfico
    [status, result] = system( ['wc -l ', training_filename] );
    dataset = training_filename(length(training_filename)-4);

    % Lectura de entrada y salida
    [xs zs] = read(training_filename, bipolar);
    
    % Filtrado y normalizacion de los datos de entrada
    xs = normalizar(xs);
    
    % Fijo parametros de la red
    input = size(xs, 2);
    output = size(zs, 2);
    arq = [input hlayers output];
    
    % Creacion y entrenamiento de la neuronal network
    mp = MyMultiPerceptron(arq, gamma, mode);
    [ep_errors] = mp.train(xs, zs, max_error, epochs);
    final_error = ep_errors(length(ep_errors));


    % Guardado del estado de la misma
    guardar(output_filename, input, hlayers, output, mp.weights, mode);
    

    % Creacion de grafico con el error en funcion de la epoca
    set(0,'DefaultFigureVisible','off');
    fig = figure;
    plot([1:length(ep_errors)], ep_errors, 'b.');
    title('Error en funcion de las epocas');
    xlabel('Epoca');
    ylabel('Error');
    if dataset == '1'
        axis([-inf,inf,0,0.2]); % Para el dataset1
    elseif dataset == '2'
        axis([-inf,inf,0,2]); % Para el dataset2
    end
    set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
    set(gcf, 'PaperSize', [5 5]);
    saveas(fig, graph_filename);
end