close all;
clear all;
% 3次元ベクトルの始点Oと終点Pの定義
O = [0, 0, 0];
P = [3, 4, 5];
OP = P - O;
% OPを成分に分解
VecR = [OP(1), 0, 0];
VecS = [0, OP(2), 0];
VecT = [0, 0, OP(3)];
% ベクトルOPをプロット
quiver3(O(1), O(2), O(3), OP(1), OP(2), OP(3), 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
hold on;
Q = O;
quiver3(Q(1), Q(2), Q(3), VecR(1), VecR(2), VecR(3), 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
Q = VecR + O;
quiver3(Q(1), Q(2), Q(3), VecS(1), VecS(2), VecS(3), 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
Q = VecS + Q;
quiver3(Q(1), Q(2), Q(3), VecT(1), VecT(2), VecT(3), 'LineWidth', 2, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
% 軸ラベルとグリッドの設定
xlabel('$x$', 'Interpreter', 'latex','FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex','FontSize', 14);
zlabel('$z$', 'Interpreter', 'latex','FontSize', 14);
grid on;
% 点Oと点Pをプロット
plot3(O(1), O(2), O(3), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
plot3(P(1), P(2), P(3), 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
% 線分OPをプロット
plot3([O(1), P(1)], [O(2), P(2)], [O(3), P(3)], 'k--');
% 距離lを計算
l = norm(OP);
% 距離lを表示
text(P(1), P(2), P(3), ['$\ \ \  l = $', num2str(l)], 'HorizontalAlignment', 'left', 'Interpreter', 'latex','FontSize', 14);
% 凡例の表示
legend('$\overrightarrow{OP}$', '$\vec{r}$', '$\vec{s}$', '$\vec{t}$', 'Interpreter', 'latex','FontSize', 14);