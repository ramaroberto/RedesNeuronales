function [model ep_errors] = train_mlp(input, target, arq, iterations, learning_rate)
    % this is the function that handles all the looping and running of the
    % neural network, it initializes the network based on the number of
    % hidden layers, and presents every item in the input over and over,
    % $iterations$ times.
    % hidden is the only complicated variables.  Like weka, it accepts a
    % list of values (as a row vector), and interprets it as the number of
    % neurons in each hidden layer, so [2 2 2] means there will be an input
    % layer defined by the size of the input, three hidden layers, with 2 
    % neurons each, and the output layer, defined by the target.  I think
    % it's pretty good.
    
    % initialize the output
    model = [];
    model.learning_rate = learning_rate;

    % characterize the input and output
    [ntrain nInLayer] = size(input);
    [jnk nOutLayer] = size(target);

    % keep track of how many neurons are in each layer
    nNeurons = arq;
    nNeurons(nNeurons == 0) = []; % remove 0 layers, to allow putting a zero for no hidden layers

    % there are one fewer sets of weights and biases as total layers
    nTransitions = length(nNeurons)-1;

    for i = 1:nTransitions % initialize the weights between layers, and the biases (past the first layer)
        model.weights{i} = randn(nNeurons(i),nNeurons(i+1)); 
        % the weight matrix has X rows, where X is the number of input
        % neurons to the layer, and Y columns, where Y is the number of
        % output neurons.  multiplication of the input with the weight
        % matrix transforms the dimensionality of the input to that of the
        % output.  Initialization is done here randomly.
        model.biases{i} = randn(1,nNeurons(i+1));
        % biases are random as well
	model.lastdelta{i} = 0;  
    end
    
    ep_errors = [];
    for i = 1:iterations % repeat the whole training set over and over
        total_run_error = 0;
        order = randperm(ntrain);  % randomize the presentations
        for j = 1:ntrain
            % update_mlp is where the training is actually done
            [model run_error] = update_mlp(model, input(order(j),:), target(order(j),:));
            total_run_error = total_run_error + run_error;
        end
        ep_errors = [ep_errors total_run_error];
    end

    ep_errors = ep_errors / size(input,1);
end
