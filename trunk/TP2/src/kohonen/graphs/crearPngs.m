function [] = crearPngs()
	fPath = '.';
	if fPath==0, error('no folder selected'), end
	fNames = dir( fullfile(fPath,'*.fig') );
	fNames = strcat(fPath, filesep, {fNames.name});

	%# process each file
	for i=1:length(fNames)
	    openfig(fNames{i});
		set(findobj(0,'type','figure'),'visible','on');
		xlabel('X');
		ylabel('Y');
		zlabel('Z');
		axis([-4 4 -4 4 -4 4]);
		print(['pngs/' fNames{i}(1:end-4) '_0P.png'], '-dpng');
		view(0,0);
		print(['pngs/' fNames{i}(1:end-4) '_1XZ.png'], '-dpng');
		view(0,90);
		print(['pngs/' fNames{i}(1:end-4) '_2XY.png'], '-dpng');
		view(90,0);
		print(['pngs/' fNames{i}(1:end-4) '_3YZ.png'], '-dpng');
	end

%function [] = crearPngs(filename)
%	openfig(filename);
%	set(findobj(0,'type','figure'),'visible','on');
%	xlabel('X');
%	ylabel('Y');
%	zlabel('Z');
%	axis([-4 4 -4 4 -4 4]);
%	print(['pngs/' filename(1:end-4) '0P.png'], '-dpng');
%	view(0,0);
%	print(['pngs/' filename(1:end-4) '1XZ.png'], '-dpng');
%	view(0,90);
%	print(['pngs/' filename(1:end-4) '2XY.png'], '-dpng');
%	view(90,0);
%	print(['pngs/' filename(1:end-4) '3YZ.png'], '-dpng');