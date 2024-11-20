close all;
clear all;
% 3Dグリッドの作成
[x, y] = meshgrid(-5:0.3:5, -5:0.3:5);
% 図を作成
figure;
% 曲面の式
z_curve = 3.0*sin(sqrt(x.^2 + y.^2));
% 平面の式
% x - y + 1.8z -k = 0
% 平面垂直ベクトルの始点と終点
posO = [0, 0, 0];
posE = [1, -1, 1.8];
for k = 5:-0.1:-5
    % 平面の方程式
    z_plane = (k - x + y) / 1.8;
    % 平面の表示（透明度を上げる）
    surf(x, y, z_plane, 'FaceAlpha', 0.1, 'FaceColor', 'blue');
    hold on;
    % 曲面を平面で切断
    z_curve_cut = min(z_curve, z_plane);
    % 曲面の断面を表示
    surf(x, y, z_curve_cut, 'FaceAlpha', 0.7, 'FaceColor', 'red');
    % ベクトルをプロット（矢印あり）
    quiver3(posO(1), posO(2), posO(3), ...
            posE(1), posE(2), posE(3), ...
            'b', 'LineWidth', 2, 'MaxHeadSize', 0.8);
    % 軸ラベルとタイトルの設定
    xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
    ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);
    zlabel('$z$', 'Interpreter', 'latex', 'FontSize', 14);
    % グリッドの表示
    grid on;
    % 軸の等倍性を保持
    axis equal;
    % ビューの設定
    view(3);
    % グラフの表示範囲の設定
    xticks(-5:1:5);
    yticks(-5:1:5);
    zticks(-5:1:5);
    % 描画を更新
    drawnow;
    % 描画をクリア
    hold off;
    % 表示を0.1[s]ストップ
    pause(0.1);
end
