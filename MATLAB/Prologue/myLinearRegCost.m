close all;
clear all;
% 入力データ
X = [
%面積, 部屋数, 築年数, 駅距離
  85,      2,    20, 0.3;
 100,      3,    10, 0.9;
 120,      4,     5, 0.5;
 150,      5,     3, 0.1;
 110,      3,     8, 0.6;
 130,      4,     2, 0.4;
 140,      5,     1, 0.2;
  90,      2,    15, 0.1
];
% 入力データ：中古価格
y = [3000; 3180; 3500; 3900; 3350; 3600; 3800; 3100]; 
% 線形回帰モデルの適用
model = fitlm(X, y);
% モデル特性を表示
disp(model);
% 予測用データの入力
% 面積115[m^2], 数3[部屋], 築年数5[年],駅距離0.2[km]
predData = [115, 3, 5, 0.2]; 
% 予測
predicted = predict(model, predData);
% 予測結果を表示
fprintf('予想中古価格: %.2f\n', predicted);
% 面積と価格の関係をプロット
figure;
hold on;
% 基データプロット
scatter(X(:, 1), y, 'bo', 'DisplayName', '実データ');
% 予測データプロット
scatter(predData(1), predicted, 'ro', 'DisplayName', '予測データ');
% 面積範囲に対して予測された価格をプロット
areaRange = linspace(min(X(:, 1)), max(X(:, 1)), 100)';
numSamples = length(areaRange);
% 他変数の平均値を使用
otherVars = mean(X(:, 2:end), 1); 
% 予測線の計算と表示
X_pred = [areaRange, repmat(otherVars, numSamples, 1)];
y_pred = predict(model, X_pred);
plot(areaRange, y_pred, 'g-', 'DisplayName', '予測線');
% グラフの設定
xlabel('延べ床面積 (m^2)');
ylabel('中古住宅価格 (万円)');
title('中古住宅価格予測');
legend show;
grid on;
hold off;