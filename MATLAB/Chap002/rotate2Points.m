close all;
clear all;
% 始点Aと終点Bの定義
A = [1; 2];
B = [3; 4];
% ラジアン値を求める
theta = deg2rad(30);
% 回転行列の定義
R = [cos(theta), -sin(theta);
     sin(theta), cos(theta)];
% 原点を中心に回転
RA = R * A;
RB = R * B;
figure;
hold on;
% AとBをプロット
plot ([A(1), B(1)], [A(2), B(2)], 'ro-');
% RAとRBをプロット
plot ([RA(1), RB(1)], [RA(2), RB(2)], 'bo-');
% 軸とラベルの設定
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);
axis ([-1 4 0 6]);
axis equal; 
grid on;
hold off;
