X = 	[10:10:100];

D1_f1_1000ep 	= 	[0.075871, 0.062337, 0.059350, 0.047218, 0.047358];
D1_f1_1500ep 	= 	[0.057517, 0.052455, 0.055615, 0.047835, 0.051004];
D1_f1_2000ep 	= 	[0.051917, 0.045753, 0.044816, 0.044218, 0.046752];
D1_f1_2500ep 	= 	[];
D1_f1_3000ep 	= 	[];

D1_f2_1000ep 	= 	[];
D1_f2_1500ep 	= 	[];
D1_f2_2000ep 	= 	[];
D1_f2_2500ep 	= 	[];
D1_f2_3000ep 	= 	[];

D1_f3_1000ep 	= 	[];
D1_f3_1500ep 	= 	[];
D1_f3_2000ep 	= 	[];
D1_f3_2500ep 	= 	[];
D1_f3_3000ep 	= 	[];

D1_f4_1000ep 	= 	[];
D1_f4_1500ep 	= 	[];
D1_f4_2000ep 	= 	[];
D1_f4_2500ep 	= 	[];
D1_f4_3000ep 	= 	[];


D2_f1_1000ep 	= 	[];
D2_f1_1500ep 	= 	[];
D2_f1_2000ep 	= 	[];
D2_f1_2500ep 	= 	[];
D2_f1_3000ep 	= 	[];

D2_f2_1000ep 	= 	[];
D2_f2_1500ep 	= 	[];
D2_f2_2000ep 	= 	[];
D2_f2_2500ep 	= 	[];
D2_f2_3000ep 	= 	[];

D2_f3_1000ep 	= 	[];
D2_f3_1500ep 	= 	[];
D2_f3_2000ep 	= 	[];
D2_f3_2500ep 	= 	[];
D2_f3_3000ep 	= 	[];

D2_f4_1000ep 	= 	[];
D2_f4_1500ep 	= 	[];
D2_f4_2000ep 	= 	[];
D2_f4_2500ep 	= 	[];
D2_f4_3000ep 	= 	[];



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

gamma = '0.2';

% Seteo de escalas
escalaX = [10:10:100];
escalaYD1 = [0:0.05:ySupD1];
escalaYD2 = [0:0.1:ySupD2];



fig = figure;

plot(X,D1_f1_1000ep,'.','MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', tam_marker); hold on
plot(X,D1_f1_1500ep,'.','MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', tam_marker); hold on
plot(X,D1_f1_2000ep,'.','MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', tam_marker); hold on
plot(X,D1_f1_2500ep,'.','MarkerEdgeColor', 'c', 'MarkerFaceColor', 'c', 'MarkerSize', tam_marker); hold on
plot(X,D1_f1_3000ep,'.','MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm', 'MarkerSize', tam_marker);

xlim([0 110]);
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