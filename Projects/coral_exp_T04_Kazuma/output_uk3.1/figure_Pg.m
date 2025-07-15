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
        target1 = table. J_ep_in;
%        target2 = table.Vo;
       
    
%         figure(i)
        figure(1)
        subplot(1,5,i)
        plot(time,target1,'LineWidth',3);
        hold on
%        plot(time,target2,'LineWidth',3);
       
        ylim([0 0.6]);
        set(gca, 'FontSize',18,'FontName','Times');
        ylabel('pmol e- /cell s')
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