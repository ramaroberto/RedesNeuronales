function test()
    p = MyPerceptron(2, 0.1);
    xs = [0 0; 0 1; 1 0; 1 1];
    zs = [0; 0; 0; 1];
    p.learning(xs, zs, 0, 100000);
    p.feedForward([0 0])
    p.feedForward([0 1])
    p.feedForward([1 0])
    p.feedForward([1 1])
end