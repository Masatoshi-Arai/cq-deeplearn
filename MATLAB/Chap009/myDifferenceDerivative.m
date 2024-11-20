% 差分微分の例: f(x) = x^3
clc; close all; clear all;
% xの範囲と離散サイズの設定
h = 0.2;         % 離散サイズ
x = -2.0:h:1.5;% xの範囲
% 元の関数とその解析的な微分
f = x.^3;        % 関数 f(x) = x^3
f_exact = 3 * x.^2;  % 解析的な微分 f'(x) = 3x^2
% 前進/後退/中央差分による差分微分
f_forward  = conv(f, [0; -1; 1], 'valid');
f_backward = conv(f, [-1; 1; 0], 'valid');
f_central = conv(f, [-0.5; 0; 0.5], 'valid');
% プロット
figure;
plot(x, f, 'k-', 'LineWidth', 1.5); hold on;
plot(x, f_exact, 'r-', 'LineWidth', 1.5);
plot(x(2:end-1), f_forward, 'm--', 'LineWidth', 1.5);  % 前進差分
plot(x(2:end-1), f_backward, 'c--', 'LineWidth', 1.5);  % 後退差分
plot(x(2:end-1), f_central, 'g-.', 'LineWidth', 1.5);  % 中央差分
legend('x^3', '解析解 (3x^2)', '前進差分', '後退差分', '中央差分');
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y''=f''(x)$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y=f(x)=x^3, y''=f''(x)=3x^2$', 'Interpreter', 'latex', 'FontSize', 14);
grid on;
