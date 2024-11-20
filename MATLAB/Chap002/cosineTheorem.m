close all;
clear all;
% 頂点AとBの定義
F = [2,  2];
D = [3, -1];
cosT = 1/(sqrt(5))
sinT = sqrt(1 - cosT^2)
b = sqrt(F(1)^2+F(2)^2)
a = sqrt(D(1)^2+D(2)^2)
A = [b*cosT,  b*sinT];
B = [a, 0];
% プロット
figure;
hold on;
quiver(0, 0, F(1), F(2), 0, 'r', 'LineWidth', 0.1);
quiver(0, 0, D(1), D(2), 0, 'b', 'LineWidth', 0.1);
quiver(0, 0, A(1), A(2), 0, 'r', 'LineWidth', 2);
quiver(0, 0, B(1), B(2), 0, 'b', 'LineWidth', 2);
% x軸とy軸の表示範囲を設定
xlim([-1, 4]);
ylim([-2, 3]);
% 軸ラベルとグリッドの設定
xlabel('$x$', 'Interpreter', 'latex','FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex','FontSize', 14);
grid on;
% ベクトルCAとCBの内積を求める
dotProAB = dot(A, B);
dotProDF = dot(D, F);
% 内積の値を表示
text(1, -1.2, ['AB内積: ' num2str(dotProAB)], 'Color', 'k', 'FontSize', 12);
text(1, -1.5, ['DF内積: ' num2str(dotProDF)], 'Color', 'k', 'FontSize', 12);

hold off;