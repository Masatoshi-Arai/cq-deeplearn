clc;
close all; clear all;
% シンボリック変数の定義
syms x;
% 関数の定義
y = x^3 - 3*x^2 - x + 3;
% 1階および2階導関数の計算
y_dot = diff(y, x);
y_dotdot = diff(y_dot, x);
% 臨界点と凹凸変化点を計算
critical_points = double(solve(y_dot == 0, x));
inflection_points = double(solve(y_dotdot == 0, x));
% 結果の表示
disp('1階導関数:');
disp(y_dot);
disp('2階導関数:');
disp(y_dotdot);
disp('臨界点 (1階導関数がゼロになる点):');
disp(critical_points);
disp('凹凸変化点 (2階導関数がゼロになる点):');
disp(inflection_points);
% 定義域の設定
x_vals = linspace(-1.5, 3.5, 100);
y_vals = double(subs(y, x, x_vals));
y_dot_vals = double(subs(y_dot, x, x_vals));
y_dotdot_vals = double(subs(y_dotdot, x, x_vals));
% プロット
figure;
subplot(3, 1, 1);
plot(x_vals, y_vals, 'b', 'LineWidth', 2); hold on;
plot(critical_points, double(subs(y, x, critical_points)), 'ro', 'MarkerSize', 8);
plot(inflection_points, double(subs(y, x, inflection_points)), 'go', 'MarkerSize', 8);
title('関数 y = x^3 - 3x^2 - x + 3');
xlabel('x'); ylabel('y');
legend('y', '臨界点', '凹凸変化点');
grid on;
subplot(3, 1, 2);
plot(x_vals, y_dot_vals, 'r', 'LineWidth', 2);
title('1階導関数 y''');
xlabel('x'); ylabel('y''');
grid on;
subplot(3, 1, 3);
plot(x_vals, y_dotdot_vals, 'g', 'LineWidth', 2);
title('2階導関数 y''''');
xlabel('x'); ylabel('y''''');
grid on;
