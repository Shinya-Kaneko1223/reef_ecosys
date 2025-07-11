% 初期化処理
clear, clc, close all;
% 基本設定
filenames = {
    'coral_bl_T13-crl1_his.csv', ...
    'coral_bl_T17-crl1_his.csv', ...
    'coral_bl_T21-crl1_his.csv', ...
    'coral_bl_T25-crl1_his.csv', ...
    'coral_bl_T29-crl1_his.csv', ...
    'coral_bl_T33-crl1_his.csv'
};
legend_names = {'13℃', '17℃', '21℃', '25℃', '29℃', '33℃'};
%ファイルのヘッダー定義
crl1_hd = {'time', 'PFD', 'Pg', 'R', 'Pn', 'G', 'QC', 'TAcal', ...
                'TAcoe', 'TAamb', 'DICcal', 'DICcoe', 'DICamb', 'DOcoe', ...
                'DOamb', 'pHcal', 'pHcoe', 'pHamb', 'Wacal', 'Waamb', ...
                'fCO2cal', 'fCO2coe', 'fCO2amb', 'CO2aqcal', 'HCO3cal', ...
                'CO3cal', 'CO2aqcoe', 'HCO3coe', 'CO3coe', 'ROS', 'Rz', ...
                'F_Csec', 'F_ROS', 'F_detox', 'F_dam', 'DOCuptake', 'E_ca', ...
                'F_Cgrowth', 'Si_DIC', 'Si_DIC_2'};
plot_hd = {'ROS', 'Rz', 'F_ROS', 'F_detox', 'F_dam'};

% -データの準備
all_data = cell(1, length(filenames));
for j = 1:length(filenames)
    all_data{j} = readmatrix(filenames{j}, 'NumHeaderLines', 1);
end
time_col = find(strcmp(crl1_hd, 'time'));

% --- 1. 水温毎の個別グラフ作成 ---
for j = 1:length(filenames)
    data_mat = all_data{j};
    x_data = data_mat(:, time_col);
    for i = 1:length(plot_hd)
        cur_hd = plot_hd{i};
        y_col = find(strcmp(crl1_hd, cur_hd));
        if isempty(y_col), continue; end
        y_data = data_mat(:, y_col);
        
        % ★★★ データが全てNaNかチェック ★★★
        if all(isnan(y_data))
            warning('ファイル「%s」の列「%s」は、データが全てNaNです。', filenames{j}, cur_hd);
        end

        figure;
        plot(x_data, y_data, '-o', 'MarkerSize', 1);
        grid on;
        xlabel('time');
        ylabel(cur_hd);
        title([legend_names{j}, ' - Time series of ', cur_hd]);
    end
end

% --- 2. 水温の重ね合わせグラフ作成 ---
for i = 1:length(plot_hd)
    cur_hd = plot_hd{i};
    y_col = find(strcmp(crl1_hd, cur_hd));
    if isempty(y_col), continue; end

    figure;
    hold on;
    for j = 1:length(filenames)
        data_mat = all_data{j};
        x_data = data_mat(:, time_col);
        y_data = data_mat(:, y_col);

        % ★★★ データが全てNaNかチェック ★★★
        if all(isnan(y_data))
            warning('ファイル「%s」の列「%s」は、データが全てNaNです。', filenames{j}, cur_hd);
        end
        
        plot(x_data, y_data, '-o', 'MarkerSize', 1, 'DisplayName', legend_names{j});
    end
    
    hold off;
    grid on;
    xlabel('time');
    ylabel(cur_hd);
    title(['Comparison of ', cur_hd, ' across temperatures']);
    legend;
end