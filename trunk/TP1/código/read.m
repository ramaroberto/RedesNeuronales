function [ input, output ] = read(fileName, bipolar)
	[status, result] = system( ['wc -l ', fileName] );

	if fileName(length(fileName)-4)=='1'
		input = dlmread(fileName, ',', 0, 1);
		i = 1;
		fid = fopen(fileName,'r');
		valor = NaN;
		while ~feof(fid)
		    line = fgets(fid);
		    if line(1) == 'M'
		    	if bipolar
		    		valor = -1;
		    	else
		    		valor = 0;
		    	end
		    elseif line(1) == 'B'
		    	valor = 1;
		    end
		    output(i) = valor;
		    i = i+1;
		end
	elseif fileName(length(fileName)-4)=='2'
	    number = result(1:3);
	    numlines = str2num(number)-1;
		input = dlmread(fileName, ',', [0 0 numlines 7]);
		output = dlmread(fileName, ',', [0 8 numlines 9]);
	end