function [inputSize, layers, outputSize, W_list, modo] = cargar(filename)
	layersSize = dlmread(filename, ' ', [0 0 0 0]);
	inputSize = dlmread(filename, ' ', [0 1 0 1]);
	outputSize = dlmread(filename, ' ', [0 2 0 2]);
	weightsSize = dlmread(filename, ' ', [0 3 0 3]);
	% Leer el modo
	fileID = fopen(filename,'r');
	cell = textscan(fileID, '%s', 1, 'delimiter', '\n', 'headerlines', 1);
	modo = cell{1};

	layers = dlmread(filename, ' ', [2 0 2 layersSize-1]);

	firstWeightsLine = 3;
	rows = [inputSize+1 layers+1];
	cols = [layers outputSize];
	for c = 1:weightsSize
		W_list{c} = dlmread(filename, ' ', [firstWeightsLine 0 firstWeightsLine+rows(c)-1 cols(c)-1]);
		firstWeightsLine = firstWeightsLine + rows(c);
	end