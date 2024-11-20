%net = RightNet;         % alexnetを使用
categoryNames = net.Layers(end).Classes;
layers = net.Layers; 
inLayer = layers(1);   % 最初のレイヤ取得
outLayer = layers(end);% 最終のレイヤ取得
%img = imread(['DSC00948.JPG']);   % オリジナル人2名
img = imread(['DSC00948M6.png']);  % 人＋パンダ
figure; imshow (img);
inLayer.InputSize
% AlexNetの入力サイズに変更
imgResize = imresize(img, [32 32]);
figure; imshow (imgResize);
% 8の候補から分類
[pres, scores] = classify (net, imgResize);
% 1%以上のスコアを抽出
highscores = 0.01 < scores;
figure; bar(scores(highscores))
xticklabels(string(categoryNames(highscores)))
xtickangle(60)