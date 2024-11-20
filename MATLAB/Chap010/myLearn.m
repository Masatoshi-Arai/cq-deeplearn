% 画像データの読み込み
images = imageDatastore('..\Chap007\Rightware', ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

% 画像サイズに合わせた入力レイヤーの設定
inputSize = [32 32 3];  % 例：32x32ピクセルのRGB画像と仮定

% データの拡張（サイズが異なる場合にリサイズ）
augmentedImages = augmentedImageDatastore(inputSize, images);

% CNNのレイヤー構成
layers = [
    imageInputLayer(inputSize)
    
    convolution2dLayer(3, 8, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2, 'Stride', 2)
    
    convolution2dLayer(3, 16, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2, 'Stride', 2)
    
    convolution2dLayer(3, 32, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(numel(unique(images.Labels)))  % クラス数に基づく出力層
    softmaxLayer
    classificationLayer];

% トレーニングオプションの設定
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',10, ...
    'MiniBatchSize',64, ...
    'Shuffle','every-epoch', ...
    'Plots','training-progress', ...
    'Verbose',false);

% CNNの学習
net = trainNetwork(augmentedImages, layers, options);

% 学習が終了したモデルを保存（オプション）
save('trainedNet.mat', 'net');
