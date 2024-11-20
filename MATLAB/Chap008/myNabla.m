% シンボリック変数の定義
syms u1 u2
% 関数の定義
f = u1^2 + u2^2;
% f(u_1, u_2) の勾配を計算
grad_f = gradient(f, [u1, u2]);
% 勾配の出力
disp('勾配 ∇f(u1, u2):');
disp(grad_f);
% 数値的にプロットするためにメッシュグリッドを作成
[u1_vals, u2_vals] = meshgrid(-2:0.2:2, -2:0.2:2);
% 勾配の成分を評価
fu2 = @(u1, u2) 2*u1;  % ∂f/∂x
fu1 = @(u1, u2) 2*u2;  % ∂f/∂y
% グリッド上で勾配を計算
u = fu2(u1_vals, u2_vals);
v = fu1(u1_vals, u2_vals);
% 関数 f(x, y) のプロット
figure;
contour(u1_vals, u2_vals, u1_vals.^2 + u2_vals.^2, 20); % 等高線図
hold on;
% 勾配ベクトルをプロット
quiver(u1_vals, u2_vals, u, v, 'r');
% グラフの設定
xlabel('$u_1$', 'Interpreter', 'latex');
ylabel('$u_2$', 'Interpreter', 'latex');
zlabel('$f(u_1, u_2)$', 'Interpreter', 'latex');
legend('f(u_1, u_2) = u_1^2 + u_2^2');
axis equal;
grid on;
hold off;
