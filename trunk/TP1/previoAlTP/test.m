function test(group)
    
    if nargin < 1
        %mp = MyMultiPerceptron([2, 3, 4], 0.1)
        %clear mp;
        return
    end
    
    if strcmp(group, 'multi-xor')
        p = MyMultiPerceptron([2, 2, 1], 0.10, 'bipolar')
        p.layers{1}
        p.layers{2}
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; 1; 1; 1];
        
        %p.layers{1} = [6.382149 4.090566; 6.535708 3.949229; 2.701877 6.121340];
        %p.layers{2} = [9.109082; -8.943964; 4.334059];
        
        p.train(xs, zs, 0, 10000);
        p.feedForward([0 0])
        p.feedForward([0 1])
        p.feedForward([1 0])
        p.feedForward([1 1])
        clear p;
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