close all; clc;
clear all;
% 関数の定義
f = @(x) x.^3 - 2*x.^2 - 7*x/4 + 5/4;
% シンボリック変数の設定と関数の定義
syms x;
f_sym = x^3 - 2*x^2 - 7*x/4 + 5/4;
% 1. y = 0 のときの x の値を求める
fprintf('*** y = 0 のときの x の値\n');
% 代数的解法
sol_y0_sym = solve(f_sym == 0, x);
disp('代数的解法の結果:');
disp(double(sol_y0_sym));
% 数値解法
ini_y0 = [-2, 0, 2];
sol_y0_numeric = zeros(size(ini_y0));
for i = 1:length(ini_y0)
    sol_y0_numeric(i) = fzero(f, ini_y0(i));
end
sol_y0_numeric = unique(round(sol_y0_numeric, 4));
disp('数値解法の結果:');
disp(sol_y0_numeric);
% 2. y = 5 のときの x の値を求める
fprintf('*** y = 5 のときの x の値\n');
% 代数的解法
sol_y5_sym = solve(f_sym == 5, x);
disp('代数的解法の結果:');
disp(double(sol_y5_sym));
% 数値解法
ini_y5 = [-2, 0, 2];
sol_y5_numeric = zeros(size(ini_y5));
for i = 1:length(ini_y5)
    sol_y5_numeric(i) = fzero(@(x) f(x) - 5, ini_y5(i));
end
sol_y5_numeric = unique(round(sol_y5_numeric, 4));
disp('数値解法の結果:');
disp(sol_y5_numeric);
% 3. y' = 0 のときのQ(x, y)の値
fprintf('*** y'' = 0 のときのQ(x, y)の値\n');
% f の導関数を求める
f_prime_sym = diff(f_sym, x);
% 代数的解法
sol_yprime_sym = solve(f_prime_sym == 0, x);
disp('代数的解法の結果 (x の値):');
disp(double(sol_yprime_sym));
disp('対応する y の値:');
disp(double(subs(f_sym, x, sol_yprime_sym)));
% 数値解法
ini_yprime = [-1, 1];
sol_yprime_numeric = zeros(size(ini_yprime));
for i = 1:length(ini_yprime)
    sol_yprime_numeric(i) = fzero(matlabFunction(f_prime_sym), ini_yprime(i));
end
sol_yprime_numeric = unique(round(sol_yprime_numeric, 4));
disp('数値解法の結果 (x の値):');
disp(sol_yprime_numeric);
disp('対応する y の値:');
disp(double(subs(f_sym, x, sol_yprime_numeric)));