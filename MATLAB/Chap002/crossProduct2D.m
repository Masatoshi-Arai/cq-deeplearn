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
% 2Dプロット
figure;
quiver(Q(1), Q(2), vecA(1), vecA(2), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
hold on;
quiver(Q(1), Q(2), vecB(1), vecB(2), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
quiver(A(1), A(2), vecB(1), vecB(2), 'b', 'LineWidth', 0.5, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
quiver(B(1), B(2), vecA(1), vecA(2), 'r', 'LineWidth', 0.5, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
% 軸ラベルとグリッドの設定
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);
% グラフの表示範囲の設定
xticks(-3:0.4:3);
yticks(-3:0.4:3);
grid on;
