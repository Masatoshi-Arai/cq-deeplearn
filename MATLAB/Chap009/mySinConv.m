% サインカーブの生成
x = linspace(0, 2*pi, 50);% x軸のデータ（0から2πまで50点）
y = sin(x);               % サインカーブのデータ
% ノイズの追加
noise = 0.2 * randn(size(y));% ノイズの生成（標準偏差0.2の正規分布）
y_noisy = y + noise;         % サインカーブにノイズを追加
% 移動平均フィルタの定義（3点または10点の平均）
smooth_filter = ones(3, 1) / 3;
%smooth_filter = ones(10, 1) / 10;
% 平滑化処理（convを使用）
y_smoothed = conv(y_noisy, smooth_filter, 'same'); 
% 結果のプロット
figure;
subplot(3,1,1);
plot(x, y, 'b', 'LineWidth', 1.5);  % 元のサインカーブ
title('元のサインカーブ');
ylim([-1.5 1.5]); grid on;
subplot(3,1,2);
plot(x, y_noisy, 'r');              % ノイズ付きサインカーブ
title('ノイズ付きサインカーブ');
ylim([-1.5 1.5]); grid on;
subplot(3,1,3);
plot(x, y_smoothed, 'g', 'LineWidth', 1.5); % 平滑化したサインカーブ
title('平滑化後のサインカーブ');
ylim([-1.5 1.5]); grid on;