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
% 任意の点Pの座標を仮設定
P = [1.8, 1.4, 1.12];
scatter3(Q(1), Q(2), Q(3), 50, 'k', 'filled');
scatter3(A(1), A(2), A(3), 20, 'r', 'filled'); 
scatter3(B(1), B(2), B(3), 20, 'b', 'filled');
scatter3(P(1), P(2), P(3), 100, 'k', 'filled');
% 平面の方程式: ax + by + cz = d を設定
% 法線ベクトルをvecC(r, s, t)とすると、d = -vecC・Qとなる
d = -dot(vecC, Q)
d = -dot(vecC, A)
d = -dot(vecC, B)
% 平面の方程式を表示
fprintf('(%.2f)*x+(%.2f)*y+(%.2f)*z+(%.2f) = 0\n', vecC(1), vecC(2), vecC(3), d);
% 平面の表示
[x_plane, y_plane] = meshgrid(0.9:0.1:2.6);
z_plane = (-vecC(1) * x_plane - vecC(2) * y_plane - d) / vecC(3);
surf(x_plane, y_plane, z_plane, 'FaceAlpha', 0.1);
%z_plane2 = (-vecC(1) * x_plane - vecC(2) * y_plane - d + 0.07) / vecC(3);
%surf(x_plane, y_plane, z_plane2, 'FaceAlpha', 0.1);