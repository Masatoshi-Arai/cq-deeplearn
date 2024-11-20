close all;
clear all;
% ポリゴンの頂点を定義
Q = [1, 1, 1];
A = [2, 1.2, 1];
B = [1.5, 1.5, 1.2];
C = [1.8, 0.8, 1.5];
% ポリゴンをプロット
figure;
fill3([Q(1), B(1), A(1)], [Q(2), B(2), A(2)], [Q(3), B(3), A(3)], 'g', 'FaceAlpha', 0.5, 'DisplayName', 'Poly1');
hold on;
fill3([Q(1), A(1), C(1)], [Q(2), A(2), C(2)], [Q(3), A(3), C(3)], 'r', 'FaceAlpha', 0.1, 'DisplayName', 'Poly2');
fill3([Q(1), B(1), C(1)], [Q(2), B(2), C(2)], [Q(3), B(3), C(3)], 'b', 'FaceAlpha', 0.1, 'DisplayName', 'Poly3');
fill3([A(1), B(1), C(1)], [A(2), B(2), C(2)], [A(3), B(3), C(3)], 'y', 'FaceAlpha', 0.5, 'DisplayName', 'Poly4');
% 各ポリゴンの頂点の法線ベクトルを算出
normal1 = cross(B - Q, A - Q);
normal2 = cross(A - Q, C - Q);
normal3 = cross(C - Q, B - Q);
normal4 = cross(B - A, C - A);
% 各ポリゴンの中心座標を算出
center1 = mean([Q; A; B]);
center2 = mean([Q; A; C]);
center3 = mean([Q; B; C]);
center4 = mean([A; B; C]);
% 法線ベクトルを表示
quiver3(center1(1), center1(2), center1(3), normal1(1), normal1(2), normal1(3), 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5, 'DisplayName', 'Norm1');
quiver3(center2(1), center2(2), center2(3), normal2(1), normal2(2), normal2(3), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5, 'DisplayName', 'Norm2');
quiver3(center3(1), center3(2), center3(3), normal3(1), normal3(2), normal3(3), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5, 'DisplayName', 'Norm3');
quiver3(center4(1), center4(2), center4(3), normal4(1), normal4(2), normal4(3), 'y', 'LineWidth', 2, 'MaxHeadSize', 0.5, 'DisplayName', 'Norm4');
% 各点をプロット
scatter3(Q(1), Q(2), Q(3), 100, 'k', 'filled', 'DisplayName', 'Q');
scatter3(A(1), A(2), A(3), 100, 'r', 'filled', 'DisplayName', 'A');
scatter3(B(1), B(2), B(3), 100, 'b', 'filled', 'DisplayName', 'B');
scatter3(C(1), C(2), C(3), 100, 'g', 'filled', 'DisplayName', 'C');
% 軸ラベル表示
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);
zlabel('$z$', 'Interpreter', 'latex', 'FontSize', 14);
legend;
grid on;
