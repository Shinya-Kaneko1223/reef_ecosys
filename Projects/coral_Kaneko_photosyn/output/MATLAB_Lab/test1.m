% 初期化処理
clear, clc, close all;

% 基本設定
filenames = {
    'coral_bl_T13-zphot1_his.csv', ...
    'coral_bl_T17-zphot1_his.csv', ...
    'coral_bl_T21-zphot1_his.csv', ...
    'coral_bl_T25-zphot1_his.csv', ...
    'coral_bl_T29-zphot1_his.csv', ...
    'coral_bl_T33-zphot1_his.csv'
    };

% ファイルのヘッダー定義
zphoto1_hd = {'time', 'PFD', 'Tamb', 'QAo', 'QAr', 'QAi', 'QAt', 'QAa', ...
                'Fv/Fm', 'Y(II)', 'J_ep_in', 'Ji2a', 'Ja2i', 'kr', 's_ab', ...
                'F_zSOx', 'SOx', 'Pg', 'Pgcal', 'Vc', 'Vo', 'phi', 'F_zDO', ...
                'Chl', 'CO2', 'DO', 'F_QAp', 'NADPH', 'RuBP', 'F_zROS', 'ROS'};
plot_hd = {'QAo', 'QAr', 'QAi', 'QAt', 'QAa', 'Fv/Fm', 'Y(II)', 'J_ep_in', ...
                'F_zSOx', 'SOx', 'Vc', 'Vo', 'phi', 'F_zDO','Chl', 'CO2', ...
                'DO', 'F_zROS', 'ROS'};

% X軸の列番号
x_col = find(strcmp(zphoto1_hd, 'time'));

% 各Y軸ごとにグラフを作成
for i = 1:length(plot_hd)
    cur_hd = plot_hd{i};
    y_col = find(strcmp(zphoto1_hd, cur_hd));
    
    figure; % 指標ごとに新しいウィンドウを作成
    hold on; % 複数のグラフを重ね描き
    
    % 各ファイルからデータを読み込み
    for j = 1:length(filenames)
        current_filename = filenames{j};
        
        data_mat = readmatrix(current_filename, 'NumHeaderLines', 1);
        x_data = data_mat(:, x_col);
        y_data = data_mat(:, y_col);
        
        % 凡例用のラベルをファイル名から抽出
        legend_label = extractBetween(current_filename, '_T', '-zphot1');
        plot(x_data, y_data, '-o', 'MarkerSize', 1, 'LineWidth', 2, 'DisplayName', ['T' legend_label{1}]);
    end
    
    hold off; % 重ね書き解除
    
    grid on;
    xlabel('time');
    ylabel(cur_hd);
    title(['Time series of ', cur_hd]);
    legend('show', 'Location', 'best'); % 凡例を最適な位置に表示
    set(gca, 'FontSize', 13);
end