clear
clf

ls = dir('*zphot1_his.csv');
ls2 = dir('*paper.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
color = {'Red','blue','Red','blue','Red','blue','Red','blue','Red','blue'};
label = {'28C Vc', '32C Vc','28C Vo', '32C Vo'};
for i = 1:5
    m = 2*i -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;

        Vc = table.Vc;
       
        figure(1)
        subplot(1,5,i)
        if mod(n,2)==0   
            plot(time,Vc,'r','LineWidth',2);
        else 
            plot(time,Vc,'b','LineWidth',2);
        end

        
        hold on
        xlim([0 10]);
        ylim([0 inf]);
        pbaspect([1 3 1]);
        set(gca, 'FontSize',10,'FontName','Times');
        xlabel('time (h)');
        ylabel('F_Vc,Vo');
        title(ttl(i))
    end
    for n = m:m+1
      
        Vo = table.Vo;
         if mod(n,2)==0   
            plot(time,Vo,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,Vo,'b','LineWidth',2,LineStyle="--");
        end


    end
    legend(label);
end