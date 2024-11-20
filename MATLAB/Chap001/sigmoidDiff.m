close all;
clear all;
% 動画ファイルの準備
video_filename = 'animation.mp4';
v = VideoWriter(video_filename, 'MPEG-4');
v.FrameRate = 20; % フレームレートの設定
open(v);
% シグモイド関数の定義
sigmoid = @(u) 1 ./ (1 + exp(-u));
% シグモイド関数を微分
sigmoid_diff = @(u) sigmoid(u) .* (1 - sigmoid(u));
% uの範囲
u = linspace(-6, 6, 400);
% シグモイド関数の値
y = sigmoid(u);
% シグモイド関数の微分の値
y_diff = sigmoid_diff(u);
figure;
% 上部：シグモイド関数，下部：接線（微分）
subplot(2, 1, 1);
hold on;
grid on;
axis([-6 6 -0.5 1.5]);
plot(u, y, 'b', 'LineWidth', 2);
xlabel('$u$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$f(u)$', 'Interpreter', 'latex', 'FontSize', 14);
title('Sigmoid Function');
% アニメーションの準備
hTangent = plot(nan, nan, 'r', 'LineWidth', 1);
hPoint = plot(nan, nan, 'ro', 'MarkerFaceColor', 'b');
% 下部のサブプロット: シグモイド関数の微分
subplot(2, 1, 2);
hold on;
grid on;
axis([-6 6 -0.1 0.3]);
plot(u, y_diff, 'g', 'LineWidth', 2);
xlabel('$u$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$df(u)/du$', 'Interpreter', 'latex', 'FontSize', 14);
title('Differentiate the function');
% アニメーションの準備
hDerivativePoint = plot(nan, nan, 'bo', 'MarkerFaceColor', 'b');
% 上部サブプロットに戻ってアニメーションを実行
subplot(2, 1, 1);
for x0 = -6:0.1:6
    % シグモイド関数の値と接線の傾き
    y0 = sigmoid(x0);
    slope = sigmoid_diff(x0);
    % 接線の方程式 y = slope * (x - x0) + y0
    yTangent = slope * (u - x0) + y0;
    % 更新
    set(hTangent, 'XData', u, 'YData', yTangent);
    set(hPoint, 'XData', x0, 'YData', y0);
    % 下部サブプロットに青い点を更新
    set(hDerivativePoint, 'XData', x0, 'YData', slope);
    drawnow;
    % 動画出力
    frame=getframe(gcf);
    writeVideo(v, frame);
    pause(0.05);
    pause(0.05);
end
hold off;
% 動画ファイル閉じる
close(v);