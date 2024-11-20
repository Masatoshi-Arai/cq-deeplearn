close all hidden;
clearvars;
rng(0);

% Step 1. 初期設定
[input_data, target_data, params] = initialize();
% Step 2. ニューラルネットワークの設定
[hidden_layer, output_layer] = setupNetwork(params);
% Step 3. 学習処理
trainNetwork(input_data, target_data, hidden_layer, output_layer, params);

function [in_data, tar_data, params] = initialize()
    % 入力データと正解データの作成
    in_data = linspace(-1, 1, 50)';  % 入力
    tar_data = in_data.^3;        % 正解 (回帰問題なのでy = x^3)
    
    % パラメータの設定
    params.nInput = 1;   % 入力層
    params.nHidden = 3;  % 中間層
    params.nOutput = 1;  % 出力層
    params.weight_init_std = 0.01;  % 重み/バイアスの初期分散
    params.learning_rate = 0.1;     % 学習係数
    params.num_epochs = 2000;       % エポック数
    params.display_interval = 50;   % 結果表示間隔
    params.num_data = length(tar_data);  % データ数
end

function [hidden_layer, output_layer] = setupNetwork(params)
    % 中間層と出力層のインスタンス化
    hidden_layer = MiddleLayer(params.nInput, params.nHidden, params.weight_init_std);
    output_layer = OutputLayer(params.nHidden, params.nOutput, params.weight_init_std);
end

function trainNetwork(input_data, target_data, hidden_layer, output_layer, params)
    % epochs分回す
    for epoch = 1:params.num_epochs
        total_error = 0;  % 誤差の初期化
        plt_x = [];
        plt_y = [];
        % インデックスのシャッフル
        shuffled_indices = randperm(params.num_data);
        for idx = shuffled_indices
            x = input_data(idx, :);
            t = target_data(idx, :);
            % 順伝播
            hidden_layer.forward(x);
            output_layer.forward(hidden_layer.Y);
            % 逆伝播
            output_layer.backward(t);
            hidden_layer.backward(output_layer.dX);
            % 重みとバイアスの更新
            hidden_layer.update(params.learning_rate);
            output_layer.update(params.learning_rate);
            
            % エポックの表示条件
            if mod(epoch, params.display_interval) == 0
                y = output_layer.Y;  % 出力値
                total_error = total_error + 1.0 / 2.0 * sum((y - t).^2);  % 二乗和誤差
                % 出力の記録
                plt_x = [plt_x; x];
                plt_y = [plt_y; y];
            end
        end
% Step 4. 指定エポックで結果を表示
        if mod(epoch, params.display_interval) == 0
            displayResults(input_data, target_data, plt_x, plt_y, epoch, params, total_error);
        end
    end
end

function displayResults(input_data, target_data, plot_x, plot_y, epoch, params, total_error)
    figure;  % 新しいグラフ
    hold on;
    scatter(plot_x, plot_y, 'filled', 'r');
    plot(input_data, target_data, 'k-', 'LineWidth', 2);
    hold off;
    drawnow;
    disp(['Epoch: ', num2str(epoch), ' / ', num2str(params.num_epochs), ...
          ', Err: ', num2str(total_error / params.num_data)]);
end
