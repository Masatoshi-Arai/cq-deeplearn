close all;
clear all;
alexNet = alexnet;         % alexnetを使用
categoryNames = alexNet.Layers(end).Classes;
layers = alexNet.Layers; 
inLayer = layers(1);   % 最初のレイヤ取得
outLayer = layers(end);% 最終のレイヤ取得
img = imread('Rightware\Howard\DSC01337.JPG');
figure; imshow (img);
inLayer.InputSize
% AlexNetの入力サイズに変更
imgResize = imresize(img, [227 227]);
figure; imshow (imgResize);
% 1000の候補から分類
[pres, scores] = classify (alexNet, imgResize);
% 1%以上のスコアを抽出
highscores = 0.01 < scores;
figure; bar(scores(highscores))
xticklabels(string(categoryNames(highscores)))
xtickangle(60)