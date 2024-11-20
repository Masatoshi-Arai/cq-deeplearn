% 環境のリセットと乱数シードの固定
close all; clear; clc;
rng(0);  % 乱数シードを固定
% 画像データストアの準備
images = imageDatastore('Rightware', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
% データの分割（80%を学習用、20%を検証用）
[trainImg, testImg] = splitEachLabel(images, 0.80);
% データ拡張とリサイズ
inputSize = [227 227];
train = augmentedImageDatastore(inputSize, trainImg);
test = augmentedImageDatastore(inputSize, testImg);
% AlexNetの読み込みとネットワークの修正
alexNet = alexnet;
layers = alexNet.Layers;
layers(end-2) = fullyConnectedLayer(8);  % 全結合層の置換
layers(end) = classificationLayer();     % 分類層の置換
% 学習オプションの設定（SGDM）
options = trainingOptions('sgdm', ...
    'Momentum', 0.7, ...               % モーメンタムの設定
    'InitialLearnRate', 0.001, ...     % 学習率
    'MaxEpochs', 20, ...               % エポック数
    'Plots', 'training-progress');     % 学習進捗の可視化
% ネットワークの学習
RightNet = trainNetwork(train, layers, options);
% テストデータの分類と混同行列の表示
pLabels = classify(RightNet, test);
confusionchart(testImg.Labels, pLabels);
