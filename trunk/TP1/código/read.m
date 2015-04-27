function [ M, labels ] = read(fileName)
	[status, result] = system( ['wc -l ', fileName] )
    numlines = str2num(result)-1;
	M = csvread(fileName,0,1);
	if fileName(52)=='1'
		i = 1;
		fid = fopen(fileName,'r');
		while ~feof(fid)
		    line = fgets(fid);
		    labels(i) = line(1);
		    i = i+1;
		end
	elseif fileName(52)=='2'
		labels = dlmread(fileName,',',[0,0,499,0])
	end