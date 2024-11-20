close all;
clear all;
% シグモイド関数の定義
sigmoid = @(u) 1 ./ (1 + exp(-u));
% ステップ関数の定義
step = @(u) 0 <= u;
% uの範囲
u = linspace(-6, 6, 400);
% シグモイド関数の値
y_sigmoid = sigmoid(u);
% ステップ関数の値
y_step = step(u);
figure;
hold on;
grid on;
% シグモイド関数のプロット
plot(u, y_sigmoid, 'b', 'LineWidth', 2);
% ステップ関数のプロット
plot(u, y_step, 'black', 'LineWidth', 2);
% 軸ラベルとタイトル
xlabel('$u$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$f(u)$', 'Interpreter', 'latex', 'FontSize', 14);
title('Sigmoid and Step Functions', 'FontSize', 16);
% 凡例
legend({'Sigmoid Function', 'Step Function'}, 'Interpreter', 'latex', 'FontSize', 12);
hold off;
