% 画像の読み込み
%img = imread('train.jpg');
img = imread('bridge.jpg');path
% 画像をグレースケールに変換
gray_img = rgb2gray(img);
% SIFT特徴抽出器の作成
sift_points = detectSURFFeatures(gray_img);
% 特徴点の特徴量の抽出
[features, valid_points] = extractFeatures(gray_img, sift_points);
% 特徴点の可視化
imshow(img);
hold on;
plot(valid_points.selectStrongest(50), 'showOrientation', true);
hold off;
