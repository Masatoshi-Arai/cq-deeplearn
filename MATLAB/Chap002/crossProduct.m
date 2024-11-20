close all;
clear all;
% ベクトルAとベクトルBを定義
Q = [1, 1, 1];
A = [2, 1.2, 1];
B = [1.5, 1.5, 1.2];
vecA = A - Q;
vecB = B - Q;
% 外積Cを計算
vecC = cross(vecA, vecB);
% 3Dプロット
figure;
quiver3(Q(1), Q(2), Q(3), vecA(1), vecA(2), vecA(3), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
hold on;
quiver3(Q(1), Q(2), Q(3), vecB(1), vecB(2), vecB(3), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
quiver3(Q(1), Q(2), Q(3), vecC(1), vecC(2), vecC(3), 'g', 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
quiver3(A(1), A(2), A(3), vecB(1), vecB(2), vecB(3), 'b', 'LineWidth', 0.5, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
quiver3(B(1), B(2), B(3), vecA(1), vecA(2), vecA(3), 'r', 'LineWidth', 0.5, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
% 軸ラベルとグリッドの設定
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);
zlabel('$z$', 'Interpreter', 'latex', 'FontSize', 14);
% グラフの表示範囲の設定
xticks(-3:0.4:3);
yticks(-3:0.4:3);
zticks(-3:0.4:3);
grid on;
