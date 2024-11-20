% グラフのクリアと変数の初期化
close all;
clear all;
% ベクトルの始点座標と方向
O =    [0, 0]; % 点O
P =    [3, 2]; % 点P
Pvec = P - O; % P-O
% ベクトルをプロット
quiver(O(1), O(2), Pvec(1), Pvec(2), 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.45, 'Marker', 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
% x軸とy軸の表示範囲を設定
xlim([-1, 5]);
ylim([-1, 6]);
% 点'O'と点'P'を表示
text(-0.2, -0.4, '$O(0, 0)$', 'Interpreter', 'latex', 'FontSize', 14);
text( 2.8,  2.2, '$P(3, 2)$', 'Interpreter', 'latex', 'FontSize', 14);
% グラフに軸ラベルを追加
xlabel('$x$', 'Interpreter', 'latex','FontSize',14);
ylabel('$y$', 'Interpreter', 'latex','FontSize',14);
% グリッド（格子）表示と上書き許可
grid on;
hold on;
% ベクトルの始点と方向の座標
A = [1, 3]; % 点A
B = [4, 5]; % 点B
Bvec = B - A; % B - A
quiver(A(1), A(2), Bvec(1), Bvec(2), 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.45, 'Marker', 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');
text( .8, 2.6, '$A(1, 3)$', 'Interpreter', 'latex', 'FontSize', 14);
text( 3.8, 5.2, '$B(4, 5)$', 'Interpreter', 'latex', 'FontSize', 14);