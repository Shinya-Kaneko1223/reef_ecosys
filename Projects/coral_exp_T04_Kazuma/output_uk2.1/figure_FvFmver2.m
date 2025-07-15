clear
clf

ls = dir('*zphot1_his.csv');
ls2 = dir('*paper.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
color = {'Red','blue','Red','blue','Red','blue','Red','blue','Red','blue'};
label = {'28C modeled', '32C modeled','28C measured', '32C measured'};
for i = 1:5
    m = 2*i -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;

        Fv_Fm = table.Fv_Fm;
       
        figure(1)
        subplot(1,5,i)
        if mod(n,2)==0   
            plot(time,Fv_Fm,'r','LineWidth',5);
        else 
            plot(time,Fv_Fm,'b','LineWidth',5);
        end

        
        hold on
        xlim([0 10]);
        ylim([0 0.85]);
        pbaspect([1 3 1]);
        set(gca, 'FontSize',10,'FontName','Times');
        xlabel('time (h)');
        ylabel('Fv/Fm');
        title(ttl(i))
    end
    for n = m:m+1
        table2 = readtable(ls2(n).name);
        time2 = table2.time;
        Fv_Fm2 = table2.Fv_Fm;
        if mod(n,2)==0   
            scatter(time2,Fv_Fm2,'Red',"filled");
        else 
            scatter(time2,Fv_Fm2,'b',"filled");
        end

    end
    legend(label);
end