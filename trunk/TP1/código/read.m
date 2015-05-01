function [ input, output ] = read(fileName, bipolar)
	[status, result] = system( ['wc -l ', fileName] );
    number = result(1:3);
    numlines = str2num(number)

	if fileName(length(fileName)-4)=='1'
		input = dlmread(fileName, ',', 0, 1);
		i = 1;
		fid = fopen(fileName,'r');
		while ~feof(fid)
		    line = fgets(fid);
		    if line(1) == 'M'
		    	if bipolar
		    		output(i) = -1;
		    	else
		    		output(i) = 0;
		    	end
		    elseif line(1) == 'B'
		    	output(i) = 1;
		    end
		    i = i+1;
		end
		output = output';
	elseif fileName(length(fileName)-4)=='2'
		input = dlmread(fileName, ',', [0 0 499 7]);
		output = dlmread(fileName, ',', [0,8,499,9]);
	end