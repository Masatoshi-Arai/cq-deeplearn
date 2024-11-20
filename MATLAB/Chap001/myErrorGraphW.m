close all;
clear all;
% 動画ファイルの準備
video_filename = 'animation.mp4';
v = VideoWriter(video_filename, 'MPEG-4');
v.FrameRate = 20; % フレームレートの設定
open(v);
% 関数と関数の微分定義
E1 = @(w1) (w1).^2 + 1;
E2 = @(w1) (w1 - 1).^4 - w1.^3 + 12.48;
E1_diff = @(w1) 2*(w1);
E2_diff = @(w1) 4*(w1 - 1).^3 - 3*w1.^2;
% wの範囲指定
w_min = -1;
w_max = 4;
w_range = linspace(w_min, w_max, 100);
figure;
% 左側のグラフ（2次関数とその偏微分）
subplot(1, 2, 1);
hold on;
grid on;
xlabel('$w_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$E(u)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$Diff=\frac{\partial E(u)}{\partial w_1}$', 'Interpreter', 'latex', 'FontSize', 14);
xlim([w_min, w_max]);
ylim([-2, 10]);
plot(w_range, E1(w_range), 'b-', 'LineWidth', 1.5);
% 右側のグラフ（3次関数とその偏微分）
subplot(1, 2, 2);
hold on;
grid on;
xlabel('$w_2$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$E(u)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$Diff=\frac{\partial E(u)}{\partial w_2}$', 'Interpreter', 'latex', 'FontSize', 14);
xlim([w_min, w_max]);
ylim([-3, 15]);
plot(w_range, E2(w_range), 'r-', 'LineWidth', 1.5);
syms x;
for i = 0:69
    subplot(1, 2, 1); % 左側のグラフをアクティブ
    % E(u)点の位置: ww
    ww = 8.0 - i/10;
    eqn = (x)^2 + 1 == ww;
    sol = solve (eqn, x);
    w_point1 = max(sol);
    f_point1 = E1(w_point1);
    % 傾きを計算 (偏微分 f'(w1))
    slope = E1_diff (w_point1);
    tangent_line1 = @(w) slope * (w - w_point1) + f_point1;
    if 0 < i
        delete(h_tangent1);
    end
    % 偏微分表示
    h_tangent1 = plot(w_range, tangent_line1(w_range), 'b--', 'LineWidth', 1.5);
    legend('E(u)', 'Diff', 'Location', 'Best');
    drawnow;
    subplot(1, 2, 2); % 左側のグラフをアクティブ
    % E(u)点の位置: ww
    eqn = (x - 1)^4 - x^3 + 12.48 == ww;
    sol = vpasolve(eqn, x);
    w_point2 = max(sol);
    f_point2 = E2(w_point2);
    % 傾きを計算 (偏微分 f'(w2))
    slope = E2_diff (w_point2);
    tangent_line2 = @(w) slope * (w - w_point2) + f_point2;
    if 0 < i
        delete(h_tangent2);
    end
    % 偏微分表示
    h_tangent2 = plot(w_range, tangent_line2(w_range), 'r--', 'LineWidth', 1.5);
    legend('E(u)', 'Diff', 'Location', 'Best');
    drawnow;
    % 動画出力
    frame=getframe(gcf);
    writeVideo(v, frame);
    pause(0.05);
end
% 動画ファイル閉じる
close(v);