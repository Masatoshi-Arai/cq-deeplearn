close all;
clear all;
% SGDとSGDMの学習過程を可視化する
% パラメータ設定
u_start = 2; % 初期値
learning_rate = 0.1; % 学習率
momentum = 0.8; % モーメンタム
num_iterations = 8; % 反復回数
% 目的関数とその勾配
f = @(u) u.^4 - 4*u.^3 + 2*u.^2 + 5*u - 6;
grad_f = @(u) 4*u.^3 - 12*u.^2 + 4*u + 5;
% 初期化
u_sgd = u_start;
u_sgd_m = u_start;
velocity = 0; % モーメンタムの初期化
% 経過を保存するための配列
u_sgd_history = zeros(num_iterations, 1);
u_sgd_m_history = zeros(num_iterations, 1);
% SGDとSGDMの学習過程を記録
u_sgd_history(1) = u_sgd;
u_sgd_m_history(1) = u_sgd_m;
for i = 2:num_iterations
    % SGDの更新
    grad_sgd = grad_f(u_sgd);
    u_sgd = u_sgd - learning_rate * grad_sgd;
    u_sgd_history(i) = u_sgd;
    % SGDMの更新
    grad_sgd_m = grad_f(u_sgd_m);
    velocity = momentum * velocity - learning_rate * grad_sgd_m;
    velocity;
    u_sgd_m = u_sgd_m + velocity;
    u_sgd_m_history(i) = u_sgd_m;
end
% 関数の定義
u = linspace(1.9, 2.8, 100); % グラフの範囲を [1.5, 3] に設定
f_u = f(u);
% プロット
figure;
plot(u, f_u, 'k', 'LineWidth', 0.5);
hold on;
% 矢印で学習経路を示す
for i = 1:num_iterations-1
    % SGDの矢印
    quiver(u_sgd_history(i), f(u_sgd_history(i)), u_sgd_history(i+1) - u_sgd_history(i), f(u_sgd_history(i+1)) - f(u_sgd_history(i)), ...
        'r', 'LineWidth', 3.0, 'MaxHeadSize', 0.5, 'AutoScale', 'off');
    % SGDMの矢印
    quiver(u_sgd_m_history(i), f(u_sgd_m_history(i)), u_sgd_m_history(i+1) - u_sgd_m_history(i), f(u_sgd_m_history(i+1)) - f(u_sgd_m_history(i)), ...
        'b', 'LineWidth', 0.8, 'MaxHeadSize', 0.2, 'AutoScale', 'off');
end
% グラフの設定
xlabel('$u$', 'Interpreter', 'latex');
ylabel('$f(u)$', 'Interpreter', 'latex');
title('SGDとSGDMによる学習過程');
legend('$f(u) = u^4 - 4u^3 + 2u^2 + 5u - 6$', 'SGD', 'SGDM', 'Interpreter', 'latex');
xlim([1.9 2.8]); % x軸の範囲を [1.9, 2.8] に設定
grid on;
hold off;
