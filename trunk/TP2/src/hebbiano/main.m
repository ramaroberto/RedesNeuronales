function [weights, razon, epoca] = hebbiano(filename)
	input = csvread(filename, 0, 1);
	input = normalizarEntrada(input);
	[weights, razon, epoca] = hebbian(input, 3, 'ortog', 'sg', 100, 0.001, 0)