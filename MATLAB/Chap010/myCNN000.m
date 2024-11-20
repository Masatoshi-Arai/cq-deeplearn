close all;
clear all;
% 画像の読み込みとリサイズ
img = imread('KenMerry.png'); % 元の画像を読み込む
imgSmall = imresize(img, [128 128]); % 128x128にリサイズ
imshow(imgSmall); % リサイズされた画像を表示
% 3x3のフィルタを定義
filt = [0 -1 0; 
        -1 4 -1; 
        0 -1 0]; % 3x3のフィルタ
% 画像をグレースケールに変換 (カラー画像の場合)
imgGray = rgb2gray(imgSmall);
% フィルタリング結果を保存するための配列を初期化
convResult = zeros(size(imgGray) - size(filt) + 1);
% 畳み込みの過程を可視化
figure;
for i = 1:(size(imgGray, 1) - size(filt, 1) + 1)
    for j = 1:(size(imgGray, 2) - size(filt, 2) + 1)
        % 現在のパッチ（フィルタがかかる3x3の領域）を抽出
        imgPatch = imgGray(i:i+2, j:j+2); 
        
        % 畳み込み操作: フィルタと画像パッチの要素積の和
        convValue = sum(sum(double(imgPatch) .* filt));
        convResult(i, j) = convValue;
        
        % 画像にフィルタを適用している領域を表示
        subplot(1, 2, 1);
        imshow(imgGray);
        hold on;
        % 3x3のフィルタ適用領域を赤い四角で表示
        rectangle('Position', [j i 3 3], 'EdgeColor', 'r', 'LineWidth', 2);
        title('Applying 3x3 Filter');
        hold off;
        
        % フィルタが適用された部分を表示
        subplot(1, 2, 2);
        imshow(convResult, []);
        title('Convolution Result');
        pause(0.001); % 操作がわかりやすいように0.001秒待つ
    end
end
% 最終的な畳み込み結果を表示
figure;
imshow(convResult, []);
title('Final Convolution Result');
convResultNormalized = mat2gray(convResult); 
imwrite(convResultNormalized, 'convolution_result130.png')