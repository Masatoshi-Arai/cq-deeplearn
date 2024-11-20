% グラフのサイズ設定
[x, y] = meshgrid(-5:0.3:4, -5:0.3:4);
% 帽子型の関数定義
z = 3.0 * sin(sqrt(x.^2 + y.^2));
% 3Dプロット
figure;
h = surf(x, y, z, 'EdgeColor', 'none');
colormap(gray);  % グレースケールに設定
h.FaceAlpha = 0.5;  % 半透明に設定（0.5は50%の透明度）
% 軸ラベル
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 18);
zlabel('$z$', 'Interpreter', 'latex', 'FontSize', 18);
% カラーバー表示
colorbar;
title('$z=f(x, y)=3\sin(\sqrt{x^2+y^2})$', 'Interpreter', 'latex', 'FontSize', 18);
% 赤いボールをプロットする位置 (x, 0, z)
hold on;
for x_pos = -5:0.3:4
    y_pos = 0;  % y座標は0
    z_pos = 3 * sin(sqrt(x_pos^2 + y_pos^2));  % 関数のz座標
    plot3(x_pos, y_pos, z_pos, 'ro', 'MarkerSize', 4, 'MarkerFaceColor', 'r');
end
hold off;
