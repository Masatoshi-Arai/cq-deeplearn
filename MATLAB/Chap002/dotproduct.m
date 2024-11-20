close all;
clear all;
% ベクトルFとベクトルDの定義
F = [2,  2];
D = [3, -1];
% プロット
figure;
quiver(0, 0, F(1), F(2), 0, 'r', 'LineWidth', 2);
hold on;
quiver(0, 0, D(1), D(2), 0, 'b', 'LineWidth', 2);
% x軸とy軸の表示範囲を設定
xlim([-1, 4]);
ylim([-2, 3]);
% 軸ラベルとグリッドの設定
xlabel('$x$', 'Interpreter', 'latex','FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex','FontSize', 14);
grid on;

% ベクトルAとベクトルBの内積を計算
dotProduct = dot(D, F);
% 内積の値を表示
text(1, -1.5, ['内積: ' num2str(dotProduct)], 'Color', 'k', 'FontSize', 12);

hold off;