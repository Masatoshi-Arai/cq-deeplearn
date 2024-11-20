close all;
clear all;
% グリッドの定義
[x1, x2] = meshgrid(-3:0.1:3, -3:0.1:3);
% 多変数関数の定義
f = x1.^2 + x2.^3;
% 偏微分の計算
df_dx1 = gradient(f, 0.1, 0.1);
df_dx2 = gradient(f', 0.1, 0.1)';
% fの3次元表示
figure;
subplot(1, 2, 1);
surf(x1, x2, f)
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
zlabel('$f(x_1, x_2)$', 'Interpreter', 'latex', 'FontSize', 14);
xlim([-3, 3]);
ylim([-3, 3]);
zlim([-3, 3]);
hold on
% x2=1: 3D平面の方程式の係数
a2 = 0;     % x1の係数
b2 = 1;     % x2の係数
c2 = 0.001; % zの係数
d2 = -1;    % 定数項
z2 = (-a2*x1 - b2*x2 - d2) / c2;
surf(x1, x2, z2, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'r');
hold off;
% ベクトル表示
subplot(1, 2, 2);
quiver(x1, x2, df_dx1, zeros(size(df_dx1)), 'LineWidth', 1.0);
hold on;
quiver(-0.5, -d2, -2, 0, 'LineWidth', 1.0);
quiver(0.5, -d2, 2, 0, 'LineWidth', 1.0);
title('$\displaystyle \frac{\partial f}{\partial x_1}$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
axis([-3 3 -3 3]);
axis square;
