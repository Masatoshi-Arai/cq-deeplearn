% アニメーションによる関数と接線の表示
close all; clc;
clear all;
% 関数定義
f = @(x) x.^3 - 2*x.^2 - 7*x/4 + 5/4;
f_p = @(x) 3*x.^2 - 4*x - 7/4;  % 導関数
% プロット範囲
x_range = -1.5:0.01:3.5; % 関数と導関数の描画範囲
% グラフ設定
figure;
subplot(2, 1, 1); hold on;
xlim([-1.5 3.5]);
ylim([-4 6]);
func_plot = plot(x_range, f(x_range), 'b-', 'LineWidth', 1.5);          % 元の関数のグラフ
tan_plot = plot(nan, nan, 'r--', 'LineWidth', 1.5);                     % 接線 (後で更新)
point_plot = plot(nan, nan, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % 接線の点
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y=f(x)$', 'Interpreter', 'latex', 'FontSize', 14);
legend({'$y = x^3 - 2x^2 - \frac{7}{4}x + \frac{5}{4}$', 'Grad'}, 'Interpreter', 'latex');
title('関数と接線');
grid on;
% 導関数のプロット
subplot(2, 1, 2); hold on;
xlim([-1.5 3.5]);
ylim([-4 6]);
deriv_plot = plot(x_range, f_p(x_range), 'm-', 'LineWidth', 1.5); % 導関数のグラフ
tangent_slope_plot = plot(nan, nan, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % 傾きを示す点
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y''=f''(x)$', 'Interpreter', 'latex', 'FontSize', 14);
legend({'$y'' = 3x^2 - 4x - 7/4$'}, 'Interpreter', 'latex');
title('導関数と接線の傾き');
grid on;
% アニメーション設定
for x0 = 3:-0.1:-1
    % 接線の点 (x0, y0) と傾き angle
    y0 = f(x0);
    slope = f_p(x0);
    % 接線の表示範囲
    x_tan_range = x0-0.5:0.01:x0+0.5;
    tan_y = slope * (x_tan_range - x0) + y0;
    % グラフを更新
    set(tan_plot, 'XData', x_tan_range, 'YData', tan_y);            % 接線の更新
    set(point_plot, 'XData', x0, 'YData', y0);                      % 接線の点の更新
    set(tangent_slope_plot, 'XData', x0, 'YData', slope);           % 傾きの点の更新
    pause(0.1); % アニメーション速度を調整
end
