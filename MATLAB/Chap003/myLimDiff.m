%% Step 1.
% シンボリック変数の定義
syms x h
% 関数の定義
f = x^3 - 2*x^2 - (7/4)*x + 5/4;
% f(x + h) の計算
f_x_h = subs(f, x, x + h);
fprintf("f(x+h) = %s\n", f_x_h);
%% Step 2.
% 微分の定義に基づく差分の計算
diff = (f_x_h - f) / h;
fprintf("f(x+h)-f(x) = %s\n", diff);
fprintf(" = %s\n", simplify (diff));
%% Step 3.
% h -> 0 の極限を取る
f_prime = limit(diff, h, 0);
% 結果表示
fprintf("f'(x) = %s\n", f_prime);
