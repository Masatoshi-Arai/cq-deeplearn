classdef MiddleLayer < handle
    properties
        W       % 重み (Weights)
        B       % バイアス (Biases)
        X       % 入力データ (Input Data)
        Y       % 出力データ (Output Data)
        dW      % 重みの勾配 (Gradient of Weights)
        dB      % バイアスの勾配 (Gradient of Biases)
        dX      % 入力データの勾配 (Gradient of Input Data)
    end
    methods
        % コンストラクタ: 重みとバイアスの初期化
        function obj = MiddleLayer(num_in, num_neurons, init_width)
            obj.W = init_width * randn(num_in, num_neurons);  % 重みの初期化
            obj.B = init_width * randn(1, num_neurons);       % バイアスの初期化
        end
        
        % 順伝播: 入力から出力への計算
        function forward(obj, X)
            obj.X = X;
            U = X * obj.W + obj.B;
            obj.Y = 1 ./ (1 + exp(-U));  % シグモイド関数の適用
        end
        
        % 逆伝播: 中間層の勾配計算
        function backward(obj, dY)
            N = size(obj.X, 1);             % バッチサイズ
            delta = dY .* (1 - obj.Y) .* obj.Y; % シグモイド関数の勾配
            obj.dW = (obj.X' * delta) / N;  % 重みの勾配
            obj.dB = sum(delta, 1) / N;     % バイアスの勾配
            obj.dX = delta * obj.W';        % 次の層への勾配
        end
        
        % 更新: 重みとバイアスの更新
        function update(obj, lr)
            obj.W = obj.W - lr * obj.dW;
            obj.B = obj.B - lr * obj.dB;
        end
    end
end