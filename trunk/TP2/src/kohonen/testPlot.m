
% PRINCOMP assumes rows are the observations. 
% size(train) ans = 800   857
% SCORE * COEFF' + MM

trainFilename = ['../particiones/train_fold1.csv'];
trainInput = csvread(trainFilename, 0, 1);


%M = mean(trainInput,1);
%MM = ones(size(trainInput,1),1)*M;

%MW = mean(weights',1);
%MMW = ones(size(weights',1),1)*MW;

[COEFF,SCORE] = princomp(trainInput);
%[WCOEFF,WSCORE] = princomp(weights);

%R = SCORE*COEFF'+MM;        % == trainInput
%NS = (trainInput-MM)*COEFF; % == SCORE

%NW = (weights'-MMW)*COEFF;


%g = plot(NS(:,1),NS(:,2),'*');
%hold on
%plotsom(NW(:,1:2)'*6);

%newTrainInput = SCORE(:,1:2);
%nti = SCORE(:,1:2);


lr = 1;
sigma = 2;
M1 = 100;
M2 = 100;
epocs = 1000;
[weights] = som( SCORE(:,1:2), M1, M2, epocs, lr, sigma, true, false );

makeGridGraphic(weights, SCORE, epocs, M1, M2);

%g = plot(SCORE(:,1),SCORE(:,2),'*');
%hold on
%plotsom(weights);

%clear net;
%net = selforgmap([5 5]);
%net = configure(net,SCORE(:,1:2)');

%plotsompos(net)

%net.trainParam.epochs = 1000;
%net = train(net,SCORE(:,1:2)');
%wr = getwb(net);
%wr = reshape(wr, [25, 2])';
%plotsompos(net)