% X: 説明変数, y: 目的変数
X = [0, 1, 2, 3, 4, 5]';
y = [-0.2, 1.5, 3.2, 4.3, 7.2, 12.5]';
% 線形回帰モデル
X = [ones(length(X), 1) X]; % Xにy切片を追加
beta = (X' * X) \ X' * y;
% 予測値の計算
y_pred = X * beta;
% 結果プロット
figure;
scatter(X(:,2), y, 'r', 'filled'); % データポイント表示
hold on;
plot(X(:,2), y_pred, 'b'); % 回帰直線表示
xlabel('説明変数');
ylabel('目的変数');
title('線形回帰');
