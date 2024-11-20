% ソフトマックス関数
function y = softmax(u)
    % 入力: u - 入力ベクトル
    % 出力: y - 確率ベクトル
    % 入力の最大値を引くことで数値的安定性を確保
    ex = exp(u - max(u));
    % ソフトマックスの計算
    y = ex ./ sum(ex);
end
close all;
clear all;
figure;
% ソフトマックス関数のプロット
u_1 = -10:.1:10; % 入力データ
u_2 = ones(size(u_1))*2;
u_3 = ones(size(u_1))*3; 
% 3つの異なる入力ベクトルを列として持つ行列に変換
u_vec = [u_1; u_2; u_3];
y_softmax = softmax(u_vec); % ソフトマックス関数の出力
plot(u_1, y_softmax, 'LineWidth', 3);
title('Softmax Function');
xlabel('$u_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$f(u): Probability$', 'Interpreter', 'latex', 'FontSize', 14);
grid on;
