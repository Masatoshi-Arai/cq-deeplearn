% データの定義
x = [-2.00, -1.00, 0.00, 1.00, 2.00, 3.00];
y = [-8.00, -1.00, 0.00, 1.00, 8.00, 27.00];
% 連続値プロット用に補間
x_cont = linspace(min(x), max(x), 100); % 連続的な x 値の生成
y_cont = interp1(x, y, x_cont, 'pchip'); % pchip 補間で連続値の y を取得
% プロットの設定
figure;
hold on;
% 連続値のプロット
h2 = plot(x_cont, y_cont, 'b-', 'LineWidth', 1.5); % 連続プロット（青線）
% 離散値のプロット
h3 = stairs(x, y, 'g', 'LineWidth', 1.5); % ステップ関数プロット（緑線）
% ドットだけを表示
h0 = plot(x, y, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerSize', 6); 
% 軸ラベルとタイトル
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y=f(x)$', 'Interpreter', 'latex', 'FontSize', 14);
title('連続値と離散値の微分');
% 凡例
legend([h0, h2, h3], {'データ点', '連続値(アナログ)', '離散値(デジタル)'}, 'Location', 'northwest');
% グリッドを表示
grid on;
hold off;

