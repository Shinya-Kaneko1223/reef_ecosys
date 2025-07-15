clear
clf

ls = dir('*zphot1_his.csv');
ls2 = dir('*paper.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
label = {'28C', '32C'};
for i = 1:5
    m = 2*i -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        table2 = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;
        time2 = table.time;

        Fv_Fm = table.Fv_Fm;
        Fv_Fm2 = table.Fv/Fm;
       
    
%         figure(i)
        figure(1)
        subplot(1,5,i)
        plot(time,Fv_Fm,'LineWidth',5);
        hold on
        ylim([0 0.8]);
        set(gca, 'FontSize',18,'FontName','Times');
        xlabel('time (h)');
        ylabel(['Fv/Fm']);
        title(ttl(i))
%         if mod(n,2) == 1
%             legend(label(1))
%         else
%             legend(label(2),)
%         end
    end
    legend(label);
end