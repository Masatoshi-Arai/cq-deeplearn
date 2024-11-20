% グラフのクリアと変数の初期化
close all;
clear all;
% ベクトルの始点座標と方向
A = [1, 1]; % 点A
B = [3, 2]; % 点B
Bvec = B - A;
% ベクトルをプロット
quiver(A(1), A(2), Bvec(1), Bvec(2), 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.45, 'Marker', 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
% x軸とy軸の表示範囲を設定
xlim([-1, 5]);
ylim([-1, 6]);
% 点'A'と点'B'を表示
text(0.8, 0.5, '$A(1, 1)$', 'Interpreter', 'latex', 'FontSize', 14);
text( 2.8, 1.4, '$B(3, 2)$', 'Interpreter', 'latex', 'FontSize', 14);
% グラフに軸ラベルを追加
xlabel('$x$', 'Interpreter', 'latex','FontSize',14);
ylabel('$y$', 'Interpreter', 'latex','FontSize',14);
% グリッド（格子）表示と上書き許可
grid on;
hold on;
% ベクトルの始点(点A)と方向の座標
C = [2, 3] % 点C
Cvec = C - A; % C - A
quiver(A(1), A(2), Cvec(1), Cvec(2), 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.45, 'Marker', 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');
text(1.0, 3.0, '$C(2, 3)$', 'Interpreter', 'latex', 'FontSize', 14);
% ベクトルの加算
ACvec = Bvec + Cvec;
quiver(A(1), A(2), ACvec(1), ACvec(2), 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.45, 'Marker', 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'g');
text(4.2, 4.0, '$E(4, 4)$', 'Interpreter', 'latex', 'FontSize', 14);