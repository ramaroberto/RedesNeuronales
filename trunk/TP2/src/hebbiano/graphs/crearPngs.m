function [] = crearPngs(filename)
	openfig(filename);
	set(findobj(0,'type','figure'),'visible','on');
	