function test(group)
    
    if nargin < 1
        %mp = MyMultiPerceptron([2, 3, 4], 0.1)
        %clear mp;
        return
    end
    
    if strcmp(group, 'multi-xor')
        % [2 2 3 1] significa:
        % 2 dimensiones de entrada
        % 2 neuronas en la primera capa oculta
        % 3 neuronas en la segunda capa oculta
        % 1 dimension de salida
        mp = MyMultiPerceptron([2 2 3 1], 0.10, 'bipolar')
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; 1; 1; -1];
        
        %p.layers{1} = [6.382149 4.090566; 6.535708 3.949229; 2.701877 6.121340];
        %p.layers{2} = [9.109082; -8.943964; 4.334059];
        
        error = mp.train(xs, zs, 0, 1000)
        mp.feedForward([0 0])
        mp.feedForward([0 1])
        mp.feedForward([1 0])
        mp.feedForward([1 1])
        clear mp;
    end

    if strcmp(group, 'perceptron-xor')
        p = MyPerceptron(2, 0.1, 'binary');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [0; 1; 1; 0];
        p.train(xs, zs, 0, 100);
        checkAnswer(xs, zs, p, 0.1)
        clear p;        
    end
    
    if strcmp(group, 'perceptron-and')
        p = MyPerceptron(2, 0.25, 'scalar');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; -1; -1; 1];
        p.train(xs, zs, 0, 100);
        checkAnswer(xs, zs, p, 0.1)
        clear p;

        p = MyPerceptron(2, 0.25, 'bipolar');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; -1; -1; 1];
        p.train(xs, zs, 0, 1000);
        checkAnswer(xs, zs, p, 0.1)
        clear p;

        p = MyPerceptron(2, 0.25, 'binary');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [0; 0; 0; 1];
        p.train(xs, zs, 0, 1000);
        checkAnswer(xs, zs, p, 0.1)
        clear p;
    end
    
    if strcmp(group, 'perceptron-or')
        p = MyPerceptron(2, 0.25, 'scalar');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; 1; 1; 1];
        p.train(xs, zs, 0, 100);
        checkAnswer(xs, zs, p, 0.1)
        clear p;
        
        p = MyPerceptron(2, 0.25, 'bipolar');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; 1; 1; 1];
        p.train(xs, zs, 0, 1000);
        checkAnswer(xs, zs, p, 0.1)
        clear p;
        
        p = MyPerceptron(2, 0.25, 'binary');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [0; 1; 1; 1];
        p.train(xs, zs, 0, 1000);
        checkAnswer(xs, zs, p, 0.1)
        clear p;
    end
end

function r = checkAnswer(xs, zs, p, err)
    r = 1;
    for i = size(xs, 1)
        z = zs(i);
        y = p.feedForward(xs(i,:));
        r = r && (abs(z-y) < err);
    end
end