% 初期化処理
clear, clc, close all;

% 基本設定
filename = 'coral_bl_T13-crl1_his.csv';
%filename = 'coral_bl_T17-crl1_his.csv';
%filename = 'coral_bl_T21-crl1_his.csv';
%filename = 'coral_bl_T25-crl1_his.csv';
%filename = 'coral_bl_T29-crl1_his.csv';
%filename = 'coral_bl_T33-crl1_his.csv';

%ファイルのヘッダー定義 → 使うデータのヘッダー指定
crl1_hd = {'time', 'PFD', 'Pg', 'R', 'Pn', 'G', 'QC', 'TAcal', ...
            'TAcoe', 'TAamb', 'DICcal', 'DICcoe', 'DICamb', 'DOcoe', ...
            'DOamb', 'pHcal', 'pHcoe', 'pHamb', 'Wacal', 'Waamb', ...
            'fCO2cal', 'fCO2coe', 'fCO2amb', 'CO2aqcal', 'HCO3cal', ...
            'CO3cal', 'CO2aqcoe', 'HCO3coe', 'CO3coe', 'ROS', 'Rz', ...
            'F_Csec', 'F_ROS', 'F_detox', 'F_dam', 'DOCuptake', 'E_ca', ...
            'F_Cgrowth', 'Si_DIC', 'Si_DIC_2'};

plot_hd = {'ROS', 'Rz', 'F_ROS', 'F_detox', 'F_dam'};

% 列番号とデータを取得 → x軸に設定
x_col = find(strcmp(crl1_hd, 'time'));
data_mat = readmatrix(filename, 'NumHeaderLines', 1);
x_data = data_mat(:, x_col);

% y軸も同様にしてグラフ連続作成
for i = 1:length(plot_hd)
cur_hd = plot_hd{i};
y_col = find(strcmp(crl1_hd, cur_hd));
y_data = data_mat(:, y_col);% y軸設定
figure;
plot(x_data, y_data, '-o', 'MarkerSize', 1); % -o は実線と丸マーカー
grid on; % グリッド線

% ラベルをヘッダー名で指定
xlabel('time');
ylabel(cur_hd);
title(['Time series of ', cur_hd]);
end