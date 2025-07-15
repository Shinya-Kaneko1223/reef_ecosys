clear
clf

ls = dir('*zphot1_his.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
label = {'28C', '32C'};
for i = 1:5
    m = 2*i -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;
        Vc4Vo = table.Vc4Vo;
%        target2 = table.Vo;
       
    
%         figure(i)
        figure(1)
        subplot(1,5,i)
        plot(time,Vc4Vo,'LineWidth',3);
        hold on
%        plot(time,target2,'LineWidth',3);
       
        ylim([0 1*10^-4]);
        set(gca, 'FontSize',18,'FontName','Times');
        ylabel('Vc4Vo ')
        xlabel('time [h]')
        title(ttl(i))
%         if mod(n,2) == 1
%             legend(label(1))
%         else
%             legend(label(2),)
%         end
    end
    legend(label);
end