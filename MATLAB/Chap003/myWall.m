close all;
clear all;
% x1=1: 3D平面の方程式の係数
a1 = 1;     % x1の係数
b1 = 0;     % x2の係数
c1 = 0.001; % zの係数
d1 = -1;    % 定数項
% x2=1: 3D平面の方程式の係数
a2 = 0;     % x1の係数
b2 = 1;     % x2の係数
c2 = 0.001; % zの係数
d2 = -1;    % 定数項
% 平面上の点の定義
[x1, x2] = meshgrid(-2:0.5:2, -2:0.5:2);
z1 = (-a1*x1 - b1*x2 - d1) / c1;
z2 = (-a2*x1 - b2*x2 - d2) / c2;
% 平面の描画
figure;
subplot(1, 2, 1);
surf(x1, x2, z1);
hold on
xlim([-2, 2]);
ylim([-2, 2]);
zlim([-2, 2]);
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
zlabel('$f(x_1, x_2)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$x_1=1$', 'Interpreter', 'latex', 'FontSize', 14);
subplot(1, 2, 2);
surf(x1, x2, z2);
hold on
xlim([-2, 2]);
ylim([-2, 2]);
zlim([-2, 2]);
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
zlabel('$f(x_1, x_2)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$x_2=1$', 'Interpreter', 'latex', 'FontSize', 14);