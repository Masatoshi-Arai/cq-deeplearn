close all;
clear all;
% 始点Aと終点Bの定義
A = [1; 2];
B = [3; 4];
% ラジアン値を求める
theta = deg2rad(30);
% Aを中心に回転
R = [cos(theta), -sin(theta);
     sin(theta), cos(theta)];
% 回転後のBの座標を計算
B_rotated = R * (B - A) + A;
figure;
hold on;
% AとBをプロット
plot (A(1), A(2), 'ro');
plot (B(1), B(2), 'ro');
% 回転後のBをプロット
plot (B_rotated(1), B_rotated(2), 'bo');
% 線分ABと回転後の線分をプロット
plot ([A(1), B(1)], [A(2), B(2)], 'ro-');
plot ([A(1), B_rotated(1)], [A(2), B_rotated(2)], 'bo-');
% 軸とラベルの設定
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);
axis ([-1 4 0 6]);
axis equal; 
grid on;
hold off;

