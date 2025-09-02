% 初期化処理
clear, clc, close all;

% 基本設定
file = {
    'coral_bl_T15_L400-zphot1_his.csv', ...
    'coral_bl_T17_L400-zphot1_his.csv', ...
    'coral_bl_T21_L400-zphot1_his.csv', ...
    'coral_bl_T25_L400-zphot1_his.csv', ...
    'coral_bl_T29_L400-zphot1_his.csv', ...
    'coral_bl_T33_L400-zphot1_his.csv'};

% ファイルのヘッダー定義
zphoto1_hd = {'time', 'PFD', 'Tamb', 'QAo', 'QAr', 'QAi', 'QAt', 'QAa', ...
                'Fv/Fm', 'Y(II)', 'J_ep_in', 'Ji2a', 'Ja2i', 'kr2o', 's_ab', ...
                'F_zSOx', 'SOx', 'Pg', 'Pgcal', 'Vc', 'Vo', 'phi', 'F_zDO', ...
                'Chl', 'CO2', 'DO', 'F_QAp', 'NADPH', 'RuBP', 'F_zROS', 'ROS'};
plot_hd = {'QAo', 'QAr', 'QAi', 'QAt', 'QAa', 'Fv/Fm', 'Y(II)', 'J_ep_in', ...
                'F_zSOx', 'SOx', 'Pg', 'Vc', 'Vo', 'phi', 'F_zDO','Chl', 'CO2', ...
                'DO', 'F_zROS', 'ROS'};

% X軸はtime
x_col = find(strcmp(zphoto1_hd, 'time'));

% 各Y軸ごとにグラフを作成
for i = 1:length(plot_hd)
    cur_hd = plot_hd{i};
    y_col = find(strcmp(zphoto1_hd, cur_hd));
    
    figure; % 指標ごとに新しいウィンドウを作成
    hold on; % 複数のグラフを重ね描き
    
    % 各ファイルからデータを読み込み
    for j = 1:length(file)
        now_file = file{j};
        
        data_mat = readmatrix(now_file, 'NumHeaderLines', 1);
        x_data = data_mat(:, x_col);
        y_data = data_mat(:, y_col);
        
        % 凡例用のラベルをファイル名から抽出
        legend_label = extractBetween(now_file, '_T', '-zphot1');
        plot(x_data, y_data, '-o', 'MarkerSize', 1, 'LineWidth', 2, 'DisplayName', ['T' legend_label{1}]);
    end
    
    hold off; % 重ね書き解除
    
    grid on;
    xlabel('Day');
    ylabel(cur_hd);
    title(['Time series of ', cur_hd]);
    legend('show', 'Location', 'best'); % 最適な位置
    set(gca, 'FontSize', 13);
end