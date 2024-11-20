% 恒等関数
function y = identity(x)
    % 入力: x - 任意の入力
    % 出力: y - 入力と同じ出力
    y = x;
end
close all;
clear all;
% 恒等関数のプロット
x_input = -10:.1:10; % 入力データ
y_ident = identity(x_input); % 恒等関数の出力
figure;
plot(x_input, y_ident);
title('Identity Function');
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$f(x)$', 'Interpreter', 'latex', 'FontSize', 14);
grid on;