% 初期化処理
clear, clc, close all;

% 基本設定
filename = 'coral_bl_T13-zoo1_his.csv';
%filename = 'coral_bl_T17-zoo1_his.csv';
%filename = 'coral_bl_T21-zoo1_his.csv';
%filename = 'coral_bl_T25-zoo1_his.csv';
%filename = 'coral_bl_T29-zoo1_his.csv';
%filename = 'coral_bl_T33-zoo1_his.csv';

%ファイルのヘッダー定義 → 使いたいデータのヘッダー指定
zoo1_hd = {'time', 'PFD', 'Pg', 'R', 'Pn', 'dens', 'QC', 'Chl', ...
                'Cg_bio', 'Cn_bio', 'Repro', 'Morta', 'F_zROS', 'F_Csec', ...
                'F_Zelm', 'Repro*dens', 'Morta*dens', 'ROS', ...
                'ROS_pmol_cell-1', 'Chl_ug_cm-2'};

plot_hd = {'dens', 'Chl', 'Repro', 'Morta', 'F_zROS', 'F_Zelm', 'Repro*dens',  ...
                'Morta*dens' 'ROS', 'ROS_pmol_cell-1', 'Chl_ug_cm-2'};

% 列番号とデータを取得 → x軸に設定
x_col = find(strcmp(zoo1_hd, 'time'));
data_mat = readmatrix(filename, 'NumHeaderLines', 1);
x_data = data_mat(:, x_col);

% y軸も同様にしてグラフ連続作成
for i = 1:length(plot_hd)
    cur_hd = plot_hd{i};
    y_col = find(strcmp(zoo1_hd, cur_hd));
    y_data = data_mat(:, y_col);% y軸設定

    figure;
    plot(x_data, y_data, '-o', 'MarkerSize', 1); % -o は実線と丸マーカー
    grid on; % グリッド線
    % ラベルをヘッダー名で指定
    xlabel('time');
    ylabel(cur_hd);
    title(['Time series of ', cur_hd]);
end
