close all;
clear all;
% 定義域
a = 1;
b = 4;
% 関数の定義
f = @(x) x.^3 - 3*x.^2 + 2*x + 1;
% 点a, bにおける関数の値
fa = f(a);
fb = f(b);
% 平均変化率
avg_slope = (fb - fa) / (b - a);
% 傾きが平均変化率に等しくなる点cの計算
syms x;
df = diff(f(x));
c_sol = solve(df == avg_slope, x);
c = double(c_sol(c_sol >= a & c_sol <= b));  % [a, b]の範囲内の解
fc = f(c);
% 図の作成
x_axis = linspace(a-1, b+1, 500);
y_vals = f(x_axis);
figure;
hold on;
% 関数のグラフ
plot(x_axis, y_vals, 'b-', 'LineWidth', 2, 'DisplayName', 'f(x)');
% 点a, b, cの描画
plot(a, fa, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Point a');
plot(b, fb, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Point b');
plot(c, f(c), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g', 'DisplayName', 'Point c');
text(a, fa, 'a', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'FontSize', 18, 'Color', 'r');
text(b, fb, 'b', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left', 'FontSize', 18, 'Color', 'r');
text(c, fc, 'c', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 18, 'Color', 'g');

% 平均変化率の直線
y_secant = fa + avg_slope * (x_axis - a);
plot(x_axis, y_secant, 'k--', 'LineWidth', 1, 'DisplayName', 'Secant Line');
% 接線の描画
y_tangent = f(c) + avg_slope * (x_axis - c);
plot(x_axis, y_tangent, 'r--', 'LineWidth', 2, 'DisplayName', 'Tangent Line at c');
% ラベルとタイトルの追加
ylim([-30, 50]);
xlabel('\(x\)', 'Interpreter', 'latex');
ylabel('\(f(x)=x^3 - 3x^2 + 2x + 1\)', 'Interpreter', 'latex');
title('Mean Value Theorem');
grid on;
hold off;
