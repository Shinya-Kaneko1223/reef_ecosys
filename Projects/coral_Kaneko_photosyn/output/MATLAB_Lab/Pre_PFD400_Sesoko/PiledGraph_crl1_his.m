% 初期化処理
clear, clc, close all;

% 基本設定
filenames = {
    'coral_bl_T13-crl1_his.csv', ...
    'coral_bl_T25-crl1_his.csv', ...
    'coral_bl_T33-crl1_his.csv'
};

% 'coral_bl_T17-crl1_his.csv', ...
%     'coral_bl_T21-crl1_his.csv', ...
%     'coral_bl_T29-crl1_his.csv', ...

legend_names = {'13℃', '25℃', '33℃'};

%ファイルのヘッダー定義 → 使うデータのヘッダー指定
crl1_hd = {'time', 'PFD', 'Pg', 'R', 'Pn', 'G', 'QC', 'TAcal', ...
                'TAcoe', 'TAamb', 'DICcal', 'DICcoe', 'DICamb', 'DOcoe', ...
                'DOamb', 'pHcal', 'pHcoe', 'pHamb', 'Wacal', 'Waamb', ...
                'fCO2cal', 'fCO2coe', 'fCO2amb', 'CO2aqcal', 'HCO3cal', ...
                'CO3cal', 'CO2aqcoe', 'HCO3coe', 'CO3coe', 'ROS', 'Rz', ...
                'F_Csec', 'F_ROS', 'F_detox', 'F_dam', 'DOCuptake', 'E_ca', ...
                'F_Cgrowth', 'Si_DIC', 'Si_DIC_2'};

plot_hd = {'ROS', 'Rz', 'F_ROS', 'F_detox', 'F_dam'};

% % 重ね合わせで使う変数のカスタム
% overlay= {
%     {'ROS', 'F_ROS', 'F_detox'}, ...
%     {'ROS', 'Rz'} ...
% };

% -データの準備
all_data = cell(1, length(filenames));

for j = 1:length(filenames)
    all_data{j} = readmatrix(filenames{j}, 'NumHeaderLines', 1);
end

time_col = find(strcmp(crl1_hd, 'time'));

%水温毎のグラフ作成
for j = 1:length(filenames)
    data_mat = all_data{j};
    x_data = data_mat(:, time_col);

    for i = 1:length(plot_hd)
        cur_hd = plot_hd{i};
        y_col = find(strcmp(crl1_hd, cur_hd));
        y_data = data_mat(:, y_col);

        figure;
        plot(x_data, y_data, '-o', 'MarkerSize', 1);
        grid on;
        xlabel('time');
        ylabel(cur_hd);
        title([legend_names{j}, 'Time series of ', cur_hd]);
    end
end

%同水温での重ね合わせグラフ
for i = 1:length(plot_hd)
    cur_hd = plot_hd{i};
    y_col = find(strcmp(crl1_hd, cur_hd));

    figure;
    hold on;

    for j = 1:length(filenames)
        data_mat = all_data{j};
        x_data = data_mat(:, time_col);
        y_data = data_mat(:, y_col);

        plot(x_data, y_data, '-o', 'MarkerSize', 1, 'DisplayName', legend_names{j});
    end
    
    hold off;
    grid on;
    xlabel('time');
    ylabel(cur_hd);
    title(['Each of ', cur_hd]);
    legend;
end



%{見たい変数同士を重ねたグラフ 単位軸のこと考えられてないのでまだ実装しない
% for j = 1:length(filenames)
%     data_mat = all_data{j};
%     x_data = data_mat(:, time_col);
% 
%     for i = 1:length(overlay)
%         cur_grp = overlay{i};
%         figure;
%         hold on;
% 
%         for k = 1:length(cur_grp)
%             cur_hd= cur_grp{k};
%             y_col = find(strcmp(crl1_hd, cur_hd));
%             y_data = data_mat(:, y_col);
%             plot(x_data, y_data, '-o', 'MarkerSize', 1, 'DisplayName', cur_hd);
%         end
% 
%         hold off;
%         grid on;
%         xlabel('time');
%         ylabel('Value');
%         title([legend_names{j}, ' - Overlay Plot']);
%         legend;
%     end