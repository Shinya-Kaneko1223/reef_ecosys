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
        target1 = table.J_ep_in;

        figure(1)
        subplot(1,5,i)
        plot(time,target1,'LineWidth',3);
        hold on

       
        ylim([0 0.0008]);
        xlim([0 10]);
        pbaspect([1 1.618 1]);
        set(gca, 'FontSize',20,'FontName','Times');
        ylabel('electron input [10^-4 pmol/cell/s]')
        xlabel('time [h]')
        title(ttl(i))
    end
    legend(label);
end