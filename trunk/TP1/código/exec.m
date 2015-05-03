clear

calefaccion = csvread('tp1_training_dataset_2_calefaccion.csv');

nlines = size(calefaccion, 1);
limit = nlines*0.5;
qinput = size(calefaccion, 2)-1;

train_xs = normalizar(calefaccion(1:limit, 1:qinput));
train_zs = calefaccion(1:limit, qinput+1);

test_xs = normalizar(calefaccion((limit+1):nlines, 1:qinput));
test_zs = calefaccion((limit+1):nlines, qinput+1);

mp = MyMultiPerceptron([qinput 5 1], 0.1, 'binary-regresion')

mp.train(train_xs, train_zs, 0, 2000);

error = 0;
for i = 1:size(test_xs, 1)
    [mp.feedForward(test_xs(i,:)) test_zs(i,:)]
    error = error + norm( mp.feedForward(test_xs(i,:)) - test_zs(i,:) );
end
error = error / size(test_xs, 1)