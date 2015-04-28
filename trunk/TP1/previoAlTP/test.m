function test(group)
    
    if nargin < 1
        p = MyPerceptron(2, 0.1, 'binary');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [0; 1; 1; 0];
        p.learning(xs, zs, 0, 100);
        checkAnswer(xs, zs, p, 0.1)
        clear p;        
        return
    end

    if strcmp(group, 'perceptron-and')
        p = MyPerceptron(2, 0.25, 'scalar');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; -1; -1; 1];
        p.learning(xs, zs, 0, 100);
        checkAnswer(xs, zs, p, 0.1)
        clear p;

        p = MyPerceptron(2, 0.25, 'bipolar');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; -1; -1; 1];
        p.learning(xs, zs, 0, 1000);
        checkAnswer(xs, zs, p, 0.1)
        clear p;

        p = MyPerceptron(2, 0.25, 'binary');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [0; 0; 0; 1];
        p.learning(xs, zs, 0, 1000);
        checkAnswer(xs, zs, p, 0.1)
        clear p;
    end
    
    if strcmp(group, 'perceptron-or')
        p = MyPerceptron(2, 0.25, 'scalar');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; 1; 1; 1];
        p.learning(xs, zs, 0, 100);
        checkAnswer(xs, zs, p, 0.1)
        clear p;
        
        p = MyPerceptron(2, 0.25, 'bipolar');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [-1; 1; 1; 1];
        p.learning(xs, zs, 0, 1000);
        checkAnswer(xs, zs, p, 0.1)
        clear p;
        
        p = MyPerceptron(2, 0.25, 'binary');
        xs = [0 0; 0 1; 1 0; 1 1];
        zs = [0; 1; 1; 1];
        p.learning(xs, zs, 0, 1000);
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
