clear
clf

ls = dir('alnius.csv');
ls2 = dir('measure_alnius.csv');
ttl = 'f(temp)';
color = {'Red','blue'};
label1 = {'model'};
label2 = {'measure'};

table = readtable(ls.name);
time = table.temp; 
Activity = table.activity;

figure(1)

plot(time,Activity,'r','LineWidth',3);


hold on

table = readtable(ls2.name);
time = table.temp; 
Activity = table.activity;
scatter(time,Activity,'filled')


xlim([0 40]);
ylim([0 1.2]);
pbaspect([1 1.618 1]);
set(gca, 'FontSize',20,'FontName','Times');
xlabel('temp(C)');
ylabel('Relative Activity');
title(ttl)
    