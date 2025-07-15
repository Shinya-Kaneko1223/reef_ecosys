clear
clf

ls = dir('*zphot1_his.csv');
ls2 = dir('*paper.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
color = {'Red','blue','Red','blue','Red','blue','Red','blue','Red','blue'};
label = {'28C Wc', '32C Wc','28C Wj', '32C Wj'};
for i = 1:5
    m = 2*i -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;

        Wc = table.Wc;
       
        figure(1)
        subplot(1,5,i)
        if mod(n,2)==0   
            plot(time,Wc,'r','LineWidth',2);
        else 
            plot(time,Wc,'b','LineWidth',2);
        end

        
        hold on
        xlim([0 10]);
        ylim([-0.002 0.002]);
        pbaspect([1 3 1]);
        set(gca, 'FontSize',10,'FontName','Times');
        xlabel('time (h)');
        ylabel('Wc,Wj');
        title(ttl(i))
    end
    for n = m:m+1
      
        Wj = table.Wj;
         if mod(n,2)==0   
            plot(time,Wj,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,Wj,'b','LineWidth',2,LineStyle="--");
        end


    end
    legend(label);
end