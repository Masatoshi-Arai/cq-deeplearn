close all;
clear all;
% MATLABコード
% 関数の定義
f = @(x1, x2) x1.^2 + x2.^3;
% データ範囲
[x1, x2] = meshgrid(0:0.2:2, 0:0.2:2);
y = f(x1, x2);
% 主要な図
figure;
hold on;
% 関数のサーフェスを描く
h = surf(x1, x2, y, 'FaceAlpha', 0.2, 'EdgeColor', 'b');
colormap(cool);  % カラーマップの設定
% 点 (x0, y0, f(x0, y0)) を描く
x10 = 0.5;
x20 = 0.5;
y0 = f(x10, x20);
plot3(x10, x20, y0, 'ko', 'MarkerFaceColor', 'k');
% 接平面の定義
% 接平面の方程式: z = f(x0, y0) + fx(x0, y0)*(x-x0) + fy(x0, y0)*(y-y0)
fx1 = @(x1, x2) 2*x1;  % f(x, y) の x に関する偏微分
fx2 = @(x1, x2) 3*x2^2;  % f(x, y) の y に関する偏微分
z_plane = @(x1, x2) y0 + fx1(x10, x20)*(x1-x10) + fx2(x10, x20)*(x2-x20);
% 接平面を描く
[x1_plane, x2_plane] = meshgrid(0.2:0.2:1.2, 0.2:0.2:1.2);
y_plane = z_plane(x1_plane, x2_plane);
surf(x1_plane, x2_plane, y_plane, 'FaceColor', 'yellow', 'FaceAlpha', 0.3, 'EdgeColor', 'k', 'LineWidth', 0.5);
% 点 (x0+dx, y0+dy, f(x0+dx, y0+dy)) を描く
dx1 = 0.4;
dx2 = 0.4;
xx1 = x10 + dx1;
xx2 = x20 + dx2;
y1 = f(xx1, xx2);
plot3(xx1, xx2, y1, 'ko', 'MarkerFaceColor', 'k');
text(x10, x20, y0, '\((x_{1_0}, x_{2_0})\)', 'Interpreter', 'latex', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 18);
text(xx1, xx2, y1, '\((x_{1_0}+d x_1, x_{2_0}+d x_2)\)', 'Interpreter', 'latex', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 18);
% 接平面と関数表面をつなぐ破線
plot3([x10, xx1], [x20, xx2], [y0, y1], 'k--', 'LineWidth', 1.5);
% 軸の設定
xlabel('\(x_1\)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('\(x_2\)', 'Interpreter', 'latex','FontSize', 18);
zlabel('\(f(x_1, x_2)\)', 'Interpreter', 'latex', 'FontSize', 18);
grid on;
view(60, 30);  % 3Dビューの設定