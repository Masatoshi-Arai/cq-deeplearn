% シンボリック変数の定義
syms u1 u2 u3
F1 = u1^2 * u2; % F1(u1, u2, u3)
F2 = u2^2 * u3; % F2(u1, u2, u3)
F3 = u1 * u3^2; % F3(u1, u2, u3)
% ベクトル場 F
F = [F1, F2, F3];
% 発散の計算（シンボリックに手動で行う）
div_F = diff(F1, u1) + diff(F2, u2) + diff(F3, u3);
% 回転の計算（シンボリックに手動で行う）
curl_F = [
    diff(F3, u2) - diff(F2, u3), ...  % u1成分
    diff(F1, u3) - diff(F3, u1), ...  % u2成分
    diff(F2, u1) - diff(F1, u2)       % u3成分
];
% 結果の表示
disp('発散 (Divergence) :');
disp(div_F);
disp('回転 (Curl) :');
disp(curl_F);
% 具体的な数値例
u1_val = 1;
u2_val = 2;
u3_val = 3;
% 発散の数値評価
div_F_val = subs(div_F, {u1, u2, u3}, {u1_val, u2_val, u3_val});
disp('発散の数値評価:');
disp(double(div_F_val));
% 回転の数値評価
curl_F_val = subs(curl_F, {u1, u2, u3}, {u1_val, u2_val, u3_val});
disp('回転の数値評価:');
disp(double(curl_F_val));
% ベクトル場の可視化
figure;
[x, y, z] = meshgrid(-1:0.5:1, -1:0.5:1, -1:0.5:1);
% ベクトル場の定義
u = x.^2 .* y;
v = y.^2 .* z;
w = x .* z.^2;
% ベクトル場の可視化 (発散)
subplot(1,2,1);
quiver3(x, y, z, u, v, w, 'LineWidth', 1.5);
xlabel('$u_1$', 'Interpreter', 'latex');
ylabel('$u_2$', 'Interpreter', 'latex');
zlabel('$u_3$', 'Interpreter', 'latex');
title('$\overrightarrow{F}(u_1, u_2, u_3)$', 'Interpreter', 'latex');
grid on;
% 回転 (curl) の計算
[curlx, curly, curlz] = curl(x, y, z, u, v, w);
% 回転の可視化
subplot(1,2,2);
quiver3(x, y, z, curlx, curly, curlz, 'LineWidth', 1.5);
xlabel('$u_1$', 'Interpreter', 'latex');
ylabel('$u_2$', 'Interpreter', 'latex');
zlabel('$u_3$', 'Interpreter', 'latex');
title('$Curl$', 'Interpreter', 'latex');
grid on;
