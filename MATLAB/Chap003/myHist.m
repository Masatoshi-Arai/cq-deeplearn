close all; clc;
clear all;
% 関数定義
f = @(x) x.^3 - 2*x.^2 - 7*x/4 + 5/4;
x_r0 = -1.5:0.01:3.0;
x_r1 = -1.5:0.125:3.0;
y0 = f(x_r0);
y1 = f(x_r1);
% y1 にプラスマイナス1.0のノイズを加える
noise_y1 = 2 * (rand(size(y1)) - 0.5);  % -1 から +1 の範囲のノイズ
y1_noisy = y1 + noise_y1;               % ノイズを加えた y1
% ヒストグラムのプロット
bar(y1_noisy);  % ノイズを加えた y1 をヒストグラムとしてプロット
hold on;
% 元の y0 のプロット
plot(x_r0 .* 8 + 13, y0, 'r-', 'LineWidth', 1.5);  % 元の y0 の曲線をプロット
% グラフの設定
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y=f(x)$', 'Interpreter', 'latex', 'FontSize', 14);
grid on;
hold off;
