X = 	[10:5:30];

D1_f1_1000ep 	= 	[0.36194, 0.36691, 0.36736, 0.36399, 0.36145];
D1_f1_1500ep 	= 	[0.36530, 0.36361, 0.36847, 0.37189, 0.36421];
D1_f1_2000ep 	= 	[0.36140, 0.36726, 0.36675, 0.36441, 0.36012];
D1_f1_2500ep 	= 	[0.36486, 0.36385, 0.36259, 0.36236, 0.36361];
D1_f1_3000ep 	= 	[0.36219, 0.37168, 0.35917, 0.36733, 0.36860];

D1_f2_1000ep 	= 	[0.35526, 0.35556, 0.35913, 0.36353, 0.35925];
D1_f2_1500ep 	= 	[0.35643, 0.35622, 0.35153, 0.35057, 0.35466];
D1_f2_2000ep 	= 	[0.34679, 0.34980, 0.35133, 0.34947, 0.35179];
D1_f2_2500ep 	= 	[0.34776, 0.35695, 0.36102, 0.35375, 0.35456];
D1_f2_3000ep 	= 	[0.35600, 0.35482, 0.35340, 0.35551, 0.3564];

D1_f3_1000ep 	= 	[0.39480, 0.38558, 0.39234, 0.38580, 0.39468];
D1_f3_1500ep 	= 	[0.39793, 0.39748, 0.39246, 0.40006, 0.39762];
D1_f3_2000ep 	= 	[0.39315, 0.39307, 0.40004, 0.39589, 0.39038];
D1_f3_2500ep 	= 	[0.39410, 0.39104, 0.39148, 0.39293, 0.38878];
D1_f3_3000ep 	= 	[0.39504, 0.38837, 0.39754, 0.39664, 0.39661];

D1_f4_1000ep 	= 	[0.35131, 0.35042, 0.35572, 0.35714, 0.35157];
D1_f4_1500ep 	= 	[0.34931, 0.35372, 0.35789, 0.35519, 0.35293];
D1_f4_2000ep 	= 	[0.35082, 0.34721, 0.34943, 0.34243, 0.36399];
D1_f4_2500ep 	= 	[0.35467, 0.34784, 0.35405, 0.34253, 0.34901];
D1_f4_3000ep 	= 	[0.35141, 0.35432, 0.34852, 0.35278, 0.34915];


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
tam_marker = 40;
tamPapelAncho = 25;
tamPapelLargo = 15;
tam_labels = 30;
tam_legend = 20;
tam_title = 40;

ySupD1 = 0.5;
ySupD2 = 3;

gamma = '0.1';

% Seteo de escalas
escalaX = [10:5:30];
escalaYD1 = [0:0.05:ySupD1];
escalaYD2 = [0:0.1:ySupD2];



fig = figure;

plot(X,D1_f1_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D1_f1_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D1_f1_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D1_f1_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D1_f1_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([5 35]);
ylim([0 ySupD1]);

h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',tam_labels,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',tam_labels,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaYD1);
set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',tam_legend);
legend boxoff;
title('Fold 1 del dataset 1','FontSize',tam_title,'FontWeight','bold');
graph_filename = ['d1_f1_' gamma '.pdf'];
grid on

set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);









fig = figure;

plot(X,D1_f2_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D1_f2_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D1_f2_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D1_f2_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D1_f2_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([5 35]);
ylim([0 ySupD1]);

h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',tam_labels,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',tam_labels,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaYD1);
set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',tam_legend);
legend boxoff;
title('Fold 2 del dataset 1','FontSize',tam_title,'FontWeight','bold');
graph_filename = ['d1_f2_' gamma '.pdf'];
grid on

set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);









fig = figure;

plot(X,D1_f3_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D1_f3_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D1_f3_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D1_f3_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D1_f3_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([5 35]);
ylim([0 ySupD1]);

h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',tam_labels,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',tam_labels,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaYD1);
set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',tam_legend);
legend boxoff;
title('Fold 3 del dataset 1','FontSize',tam_title,'FontWeight','bold');
graph_filename = ['d1_f3_' gamma '.pdf'];
grid on

set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);









fig = figure;

plot(X,D1_f4_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D1_f4_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D1_f4_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D1_f4_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D1_f4_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([5 35]);
ylim([0 ySupD1]);

h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',tam_labels,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',tam_labels,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaYD1);
set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',tam_legend);
legend boxoff;
title('Fold 4 del dataset 1','FontSize',tam_title,'FontWeight','bold');
graph_filename = ['d1_f4_' gamma '.pdf'];
grid on

set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);









fig = figure;

plot(X,D2_f1_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D2_f1_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D2_f1_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D2_f1_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D2_f1_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([5 35]);
ylim([0 ySupD2]);

h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',tam_labels,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',tam_labels,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaYD2);
set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',tam_legend);
legend boxoff;
title('Fold 1 del dataset 2','FontSize',tam_title,'FontWeight','bold');
graph_filename = ['d2_f1_' gamma '.pdf'];
grid on

set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);









fig = figure;

plot(X,D2_f2_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D2_f2_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D2_f2_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D2_f2_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D2_f2_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([5 35]);
ylim([0 ySupD2]);

h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',tam_labels,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',tam_labels,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaYD2);
set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',tam_legend);
legend boxoff;
title('Fold 2 del dataset 2','FontSize',tam_title,'FontWeight','bold');
graph_filename = ['d2_f2_' gamma '.pdf'];
grid on

set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);









fig = figure;

plot(X,D2_f3_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D2_f3_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D2_f3_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D2_f3_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D2_f3_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([5 35]);
ylim([0 ySupD2]);

h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',tam_labels,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',tam_labels,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaYD2);
set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',tam_legend);
legend boxoff;
title('Fold 3 del dataset 2','FontSize',tam_title,'FontWeight','bold');
graph_filename = ['d2_f3_' gamma '.pdf'];
grid on

set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);









fig = figure;

plot(X,D2_f4_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D2_f4_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D2_f4_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D2_f4_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D2_f4_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([5 35]);
ylim([0 ySupD2]);

h_legend = legend('1000 epocas','1500 epocas','2000 epocas','2500 epocas','3000 epocas','Location','NorthEastoutside');

xlabel('Cantidad de neuronas en la unica capa oculta','FontSize',tam_labels,'FontWeight','bold');
ylabel('Error en el conjunto de test','FontSize',tam_labels,'FontWeight','bold');
set(gca,'XTick',escalaX);
set(gca,'YTick',escalaYD2);
set(gca,'FontSize',20,'FontWeight','bold');
set(h_legend,'FontSize',tam_legend);
legend boxoff;
title('Fold 4 del dataset 2','FontSize',tam_title,'FontWeight','bold');
graph_filename = ['d2_f4_' gamma '.pdf'];
grid on

set(gcf, 'PaperPosition', [0 0 tamPapelAncho tamPapelLargo]);
set(gcf, 'PaperSize', [tamPapelAncho tamPapelLargo]);
saveas(fig, graph_filename);