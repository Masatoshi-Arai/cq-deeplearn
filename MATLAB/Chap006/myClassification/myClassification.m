close all hidden;
clearvars;
rng(0);
% 初期設定
[x_vals, y_vals, input_data, target_data, params] = initialize();
% ニューラルネットワークの設定
[hidden_layer, output_layer] = setupNetwork(params);
% 学習プロセス
trainNetwork(x_vals, y_vals, input_data, target_data, hidden_layer, output_layer, params);

function [x_vals, y_vals, input_data, target_data, params] = initialize()
    % Grid データを準備
    x_vals = -0.8:0.1:1.4;
    y_vals = -1.2:0.1:1.2;
    % 入力データと正解値の作成
    input_data = [];
    target_data = [];
    for x = x_vals
        for y = y_vals
            input_data = [input_data; x, y];
            if y < (2*x^3 - 3*x^2 + 1)
                target_data = [target_data; 0, 1];  % ガイドラインより下
            else
                target_data = [target_data; 1, 0];  % ガイドラインより上
            end
        end
    end
    % パラメータの設定
    params.nInput = 2;   % 入力層
    params.nHidden = 4;  % 中間層
    params.nOutput = 2;  % 出力層
    params.weight_init_std = 0.01;  % 重み/バイアスの初期分散
    params.learning_rate = 0.1;     % 学習係数
    params.num_epochs = 1000;       % エポック数
    params.display_interval = 100;  % 結果表示間隔
    params.num_data = size(target_data, 1);  % データ数
end
function [hidden_layer, output_layer] = setupNetwork(params)
    % 中間層と出力層のインスタンス化
    hidden_layer = MiddleLayer(params.nInput, params.nHidden, params.weight_init_std);
    output_layer = OutputLayer(params.nHidden, params.nOutput, params.weight_init_std);
end
function trainNetwork(x_vals, y_vals, input_data, target_data, hidden_layer, output_layer, params)
    % ガイドライン
    guide_line = 2 * x_vals.^3 - 3 * x_vals.^2 + 1;
    % 学習プロセス
    for epoch = 1:params.num_epochs
        total_error = 0;  % 誤差の初期化
        class_1_x = [];
        class_1_y = [];
        class_2_x = [];
        class_2_y = [];
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
            if epoch < 20 || mod(epoch, params.display_interval) == 0
                y = output_layer.Y;
                total_error = total_error - sum(t .* log(y + 1e-7));  % 交差エントロピー誤差
                % 分類結果の保存
                if y(2) < y(1)
                    class_1_x = [class_1_x, x(1)];
                    class_1_y = [class_1_y, x(2)];
                else
                    class_2_x = [class_2_x, x(1)];
                    class_2_y = [class_2_y, x(2)];
                end
            end
        end
        % エポックごとの結果を表示
        if epoch < 20 || mod(epoch, params.display_interval) == 0
            displayResults(x_vals, guide_line, class_1_x, class_1_y, class_2_x, class_2_y, epoch, params, total_error);
        end
    end
end
function displayResults(x_vals, guide_line, class_1_x, class_1_y, class_2_x, class_2_y, epoch, params, total_error)
    figure;  % 新しいグラフ
    hold on;
    scatter(class_1_x, class_1_y, 'filled', 'b');  % クラス1の青点
    scatter(class_2_x, class_2_y, 'filled', 'r');  % クラス2の赤点
    plot(x_vals, guide_line, 'k-', 'LineWidth', 2);  % ガイドライン
    axis([-0.8 1.4 -1.2 1.2]);
    drawnow;
    disp(['Epoch#, ', num2str(epoch), ' ,/ ', num2str(params.num_epochs), ...
          ', Err, ', num2str(total_error / params.num_data)]);
end

