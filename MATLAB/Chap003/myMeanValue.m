% 平均値の定理を視覚化する改良版MATLABコード
% 関数と区間の設定
a = 1; b = 4; % 区間 [a, b]
f = @(x) x.^2; % 関数 f(x) = x^2
x = linspace(a-0.5, b+0.5, 100); % 描画範囲

% f(a), f(b)の計算
fa = f(a);
fb = f(b);

% 平均の変化率（接線の傾き）
slope = (fb - fa) / (b - a);

% 中間点cをf'(c) = slopeに基づいて探す
syms c
df = matlabFunction(diff(f(sym('x')), sym('x'))); % f'(x)
c_val = vpasolve(df(c) == slope, c, [a b]); % f'(c) = slope
fc = f(double(c_val));

% グラフのプロット
figure;
plot(x, f(x), 'b-', 'LineWidth', 1.5); hold on;
plot([a b], [fa fb], 'ko', 'MarkerSize', 6, 'MarkerFaceColor', 'k'); % 点(a, f(a)), (b, f(b))
plot([a b], [fa fb], 'k--', 'LineWidth', 1); % 平均変化率の線
plot(double(c_val), fc, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r'); % 点(c, f(c))

% 接線のプロット
tangent_line = fc + slope * (x - double(c_val)); % 接線の方程式
plot(x, tangent_line, 'r-', 'LineWidth', 1.5); % 接線

% ラベル付け
text(a, fa, ' (a, f(a))', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(b, fb, ' (b, f(b))', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
text(double(c_val), fc, ' (c, f(c))', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');

xlabel('x');
ylabel('f(x)');
title('Mean Value Theorem Visualization');
legend('f(x)', 'Mean Slope Line', 'Tangent at c', 'Location', 'northwest');
grid on;
hold off;
