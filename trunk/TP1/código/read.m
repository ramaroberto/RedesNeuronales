function [ M, labels ] = read(fileName)
	[status, result] = system( ['wc -l ', fileName] );
    numlines = str2num(result)-1;
	M = csvread(fileName,0,1);
	if fileName(length(fileName)-4)=='1'
		i = 1;
		fid = fopen(fileName,'r');
		while ~feof(fid)
		    line = fgets(fid);
		    if line(1) == 'M'
		    	labels(i) = -1;
		    elseif line(1) == 'B'
		    	labels(i) = 1;
		    end
		    i = i+1;
		end
		labels = labels';
	elseif fileName(length(fileName)-4)=='2'
		labels = dlmread(fileName,',',[0,0,499,0]);
	end