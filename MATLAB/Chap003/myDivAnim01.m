% 関数と接線の表示
close all; clc;
clear all;
% 関数定義
f = @(x) x.^3 - 2*x.^2 - 7*x/4 + 5/4;
f_p = @(x) 3*x.^2 - 4*x - 7/4;  % 導関数
% プロット点と範囲
x0 = 2.5;  % 接線を描きたい点 (例として x = 2.5)
y0 = f(x0);
angle = f_p(x0);
x_range = -1.5:0.01:3.5;
x_prange = x0-0.5:0.01:x0+0.5;
% 接線の方程式
tan_line = @(x) angle * (x - x0) + y0;
% グラフのプロット
figure;
hold on;
xlim([-1.5 3.5]);
ylim([-4 6]);
plot(x_range, f(x_range), 'b-', 'LineWidth', 1.5);          % 関数のグラフ
plot(x_prange, tan_line(x_prange), 'r--', 'LineWidth', 1.5); % 接線
% 点 P(x0, y0) をプロット
plot(x0, y0, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
% ラベルと凡例
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y=f(x)$', 'Interpreter', 'latex', 'FontSize', 14);
legend({['$y = x^3 - 2x^2 - \frac{7}{4}x + \frac{5}{4}$'], 'Grad'}, 'Interpreter', 'latex');
title('関数と接線');
grid on;
hold off;
