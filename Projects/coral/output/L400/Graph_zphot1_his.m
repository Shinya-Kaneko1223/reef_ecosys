% 初期化処理
clear, clc, close all;

% 基本設定
%filename = 'coral_bl_T13-zphot1_his.csv';
filename = 'coral_bl_T17-zphot1_his.csv';
%filename = 'coral_bl_T21-zphot1_his.csv';
%filename = 'coral_bl_T25-zphot1_his.csv';
%filename = 'coral_bl_T29-zphot1_his.csv';
%filename = 'coral_bl_T33-zphot1_his.csv';

%ファイルのヘッダー定義 → 使いたいデータのヘッダー指定
zphoto1_hd = {'time', 'PFD', 'Tamb', 'QAo', 'QAr', 'QAi', 'QAt', 'QAa', ...
                'Fv/Fm', 'Y(II)', 'J_ep_in', 'Ji2a', 'Ja2i', 'kr', 's_ab', ...
                'F_zSOx', 'SOx', 'Pg', 'Pgcal', 'Vc', 'Vo', 'phi', 'F_zDO', ...
                'Chl', 'CO2', 'DO', 'F_QAp', 'NADPH', 'RuBP', 'F_zROS', 'ROS'};

plot_hd = {'QAo', 'QAr', 'QAi', 'QAt', 'QAa', 'Fv/Fm', 'Y(II)', 'J_ep_in', ...
                'F_zSOx', 'SOx', 'Vc', 'Vo', 'phi', 'F_zDO','Chl', 'CO2', ...
                'DO', 'F_zROS', 'ROS'};

% 列番号とデータを取得 → x軸に設定
x_col = find(strcmp(zphoto1_hd, 'time'));
data_mat = readmatrix(filename, 'NumHeaderLines', 1);
x_data = data_mat(:, x_col);

% y軸も同様にしてグラフ連続作成
for i = 1:length(plot_hd)
    cur_hd = plot_hd{i};
    y_col = find(strcmp(zphoto1_hd, cur_hd));
    y_data = data_mat(:, y_col);% y軸設定

    figure;
    plot(x_data, y_data, '-o', 'MarkerSize', 1, 'LineWidth', 3, 'DisplayName', cur_hd); % -o は実線と丸マーカー
    grid on; % グリッド線
    % ラベルをヘッダー名で指定
    xlabel('time');
    ylabel(cur_hd);
    title(['Time series of ', cur_hd]);
    legend("show");
    set(gca, 'FontSize', 13);
end