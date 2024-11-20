close all;
clear all;
% [x, y] のメッシュを生成
[x, y] = meshgrid(-2:1:2, -3:1:1);
% 点を表示
scatter(x, y, 'filled');
%scatter(x(:), y(:), 'filled');
hold on;
% 各座標点にラベルを追加
for i = 1:numel(x)
    text(x(i), y(i)+0.2, sprintf('(%d, %d)', x(i), y(i)), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', ...
        'FontSize', 8);
end
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);
title('Points on Grid');
axis([-2.5 2.5 -3.5 1.5]);
axis equal;

