close all;
clear all;
syms u1 u2 x1 x2
% シンボリックな関数 f(u1, u2) の定義
f_sym = u1 + u2;
% シンボリックな関数 g(x1, x2) と h(x1, x2) の定義
g_sym = x1^3 - 3 * x2;
h_sym = x1^2 - x2^2;
% x1, x2 の範囲の設定
[x1_grid, x2_grid] = meshgrid(-2:0.2:2, -2:0.2:2);
% u1, u2 を x1, x2 の関数として計算
u1_grid = double(subs(g_sym, {x1, x2}, {x1_grid, x2_grid}));
u2_grid = double(subs(h_sym, {x1, x2}, {x1_grid, x2_grid}));
% f(g(x1, x2), h(x1, x2)) の計算
f_grid = double(subs(f_sym, {u1, u2}, {u1_grid, u2_grid}));
% チェインルールに基づく偏微分の計算
% df/du1 と df/du2 を計算
df_du1 = diff(f_sym, u1);
df_du2 = diff(f_sym, u2);
% du1/dx1 と du2/dx1 を計算
du1_dx1 = diff(g_sym, x1);
du2_dx1 = diff(h_sym, x1);
% チェインルール df/dx1 の計算
df_dx1_grid = double(subs(df_du1 * du1_dx1 + df_du2 * du2_dx1, {x1, x2}, {x1_grid, x2_grid}));
% グラフを4つ表示する
figure;
% 1つ目のプロット: f(g(x1, x2), h(x1, x2))
subplot(2, 2, 1);
surf(x1_grid, x2_grid, f_grid);
xlabel('\(x_1\)', 'Interpreter', 'latex');
ylabel('\(x_2\)', 'Interpreter', 'latex');
zlabel('\(f(g(x_1, x_2), h(x_1, x_2))\)', 'Interpreter', 'latex');
title('\(f(g(x_1, x_2), h(x_1, x_2))=x_1^3 +x_1^2 - x_2^2- 3 x_2\)', 'Interpreter', 'latex');
colorbar;
shading flat;
% 2つ目のプロット: g(x1, x2)
subplot(2, 2, 2);
surf(x1_grid, x2_grid, u1_grid);
xlabel('\(x_1\)', 'Interpreter', 'latex');
ylabel('\(x_2\)', 'Interpreter', 'latex');
zlabel('\(g(x_1, x_2)\)', 'Interpreter', 'latex');
title('\(g(x_1, x_2)=x_1^3 - 3 x_2\)', 'Interpreter', 'latex');
colorbar;
shading flat;
% 3つ目のプロット: h(x1, x2)
subplot(2, 2, 3);
surf(x1_grid, x2_grid, u2_grid);
xlabel('\(x_1\)', 'Interpreter', 'latex');
ylabel('\(x_2\)', 'Interpreter', 'latex');
zlabel('\(h(x_1, x_2)\)', 'Interpreter', 'latex');
title('\(h(x_1, x_2)=x_1^2 - x_2^2\)', 'Interpreter', 'latex');
colorbar;
shading flat;
% 4つ目のプロット: df/dx1 (チェインルール)
subplot(2, 2, 4);
surf(x1_grid, x2_grid, df_dx1_grid);
xlabel('\(x_1\)', 'Interpreter', 'latex');
ylabel('\(x_2\)', 'Interpreter', 'latex');
zlabel('\(\frac{\partial f}{\partial x_1}\)', 'Interpreter', 'latex');
title('\(\frac{\partial f}{\partial x_1}=3x_1^2+2x_1\)', 'Interpreter', 'latex');
colorbar;
shading flat;
