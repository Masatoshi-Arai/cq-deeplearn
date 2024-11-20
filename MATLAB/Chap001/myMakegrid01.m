close all;
clear all;
% [x1, x2] のメッシュを生成
[x1, x2] = meshgrid(-2:1:2, -3:1:1);
% 点を表示
scatter(x1, x2, 'filled');
%scatter(x(:), y(:), 'filled');
hold on;
% 各座標点にラベルを表示
for i = 1:numel(x1)
    text(x1(i), x2(i)+0.2, sprintf('(%d, %d)', x1(i), x2(i)), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', ...
        'FontSize', 8);
end
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
title('Points on Grid');
axis([-2.5 2.5 -3.5 1.5]);
axis equal;
