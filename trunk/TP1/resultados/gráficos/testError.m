X = 	[10:5:30];

D1_f1_1000ep 	= 	[1.1,2.1,3.1,4.1,5.1];
D1_f1_1500ep 	= 	[1.2,2.2,3.2,4.2,5.2];
D1_f1_2000ep 	= 	[1.3,2.3,3.3,4.3,5.3];
D1_f1_2500ep 	= 	[1.4,2.4,3.4,4.4,5.4];
D1_f1_3000ep 	= 	[1.5,2.5,3.5,4.5,5.5];

D1_f2_1000ep 	= 	[1.1,2.1,3.1,4.1,5.1];
D1_f2_1500ep 	= 	[1.2,2.2,3.2,4.2,5.2];
D1_f2_2000ep 	= 	[1.3,2.3,3.3,4.3,5.3];
D1_f2_2500ep 	= 	[1.4,2.4,3.4,4.4,5.4];
D1_f2_3000ep 	= 	[1.5,2.5,3.5,4.5,5.5];

D1_f3_1000ep 	= 	[1.1,2.1,3.1,4.1,5.1];
D1_f3_1500ep 	= 	[1.2,2.2,3.2,4.2,5.2];
D1_f3_2000ep 	= 	[1.3,2.3,3.3,4.3,5.3];
D1_f3_2500ep 	= 	[1.4,2.4,3.4,4.4,5.4];
D1_f3_3000ep 	= 	[1.5,2.5,3.5,4.5,5.5];

D1_f4_1000ep 	= 	[1.1,2.1,3.1,4.1,5.1];
D1_f4_1500ep 	= 	[1.2,2.2,3.2,4.2,5.2];
D1_f4_2000ep 	= 	[1.3,2.3,3.3,4.3,5.3];
D1_f4_2500ep 	= 	[1.4,2.4,3.4,4.4,5.4];
D1_f4_3000ep 	= 	[1.5,2.5,3.5,4.5,5.5];


D2_f1_1000ep 	= 	[2.0420, 1.3463, 1.5114, 1.9198, 1.3619];
D2_f1_1500ep 	= 	[1.8832, 1.7998, 1.4667, 1.5138, 1.8394];
D2_f1_2000ep 	= 	[2.6700, 1.9887, 1.2180, 1.9103, 1.6805];
D2_f1_2500ep 	= 	[1.6677, 2.7759, 1.7188, 1.3499, 1.7588];
D2_f1_3000ep 	= 	[1.8044, 1.9537, 1.6749, 1.7727, 1.6936];

D2_f2_1000ep 	= 	[2.6589, 1.9316, 1.5270, 1.4358, 1.1448];
D2_f2_1500ep 	= 	[2.7359, 1.7839, 1.9039, 1.4153, 1.7787];
D2_f2_2000ep 	= 	[2.0844, 2.0873, 1.3994, 1.3926, 1.3188];
D2_f2_2500ep 	= 	[2.6961, 1.7911, 1.4841, 1.1253, 1.7573];
D2_f2_3000ep 	= 	[1.7399, 1.4271, 1.4399, 1.3623, 1.9578];

D2_f3_1000ep 	= 	[1.5256, 1.5148, 1.3370, 1.6218, 1.9730];
D2_f3_1500ep 	= 	[1.8234, 2.1898, 1.5955, 2.2929, 1.6409];
D2_f3_2000ep 	= 	[2.0440, 1.5184, 1.7966, 1.5614, 1.6130];
D2_f3_2500ep 	= 	[2.1817, 1.4681, 1.6199, 1.8749, 2.0487];
D2_f3_3000ep 	= 	[1.7393, 1.8232, 1.5235, 2.4510, 1.2817];

D2_f4_1000ep 	= 	[1.23800, 1.13080, 0.93064, 0.90880, 0.90936];
D2_f4_1500ep 	= 	[1.73880, 1.18630, 0.98481, 1.02720, 0.86921];
D2_f4_2000ep 	= 	[1.48590, 1.60790, 1.21620, 0.75574, 0.77048];
D2_f4_2500ep 	= 	[1.41010, 1.36320, 0.82037, 0.89423, 0.91900];
D2_f4_3000ep 	= 	[1.41840, 1.22930, 0.89973, 0.83290, 0.79565];



set(gcf,'Visible','off')
set(0,'DefaultFigureVisible','off');





fig = figure;

plot(X,D1_f1_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', 30); hold on
plot(X,D1_f1_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', 30); hold on
plot(X,D1_f1_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', 30); hold on
plot(X,D1_f1_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', 30); hold on
plot(X,D1_f1_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', 30);

ySup = 10;

xlim([5 35]);
ylim([0 ySup]);

% Seteo de escalas
escalaX = [10:5:30];
escalaY = [0:ySup];
h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',30,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',30,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaY);

set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',20);
title('Fold 1 del dataset 1','FontSize',40,'FontWeight','bold');
graph_filename = 'd1_f1.pdf';
grid on

tamPapelAncho = 25;
tamPapelLargo = 15;
set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);


