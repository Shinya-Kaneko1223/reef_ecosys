clear
clf

ls = dir('*zphot1_his.csv');
ls2 = dir('*paper.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
color = {'Red','blue','Red','blue','Red','blue','Red','blue','Red','blue'};
label = {'28C target1', '32C target1','28C target2', '32C target2'};
for i = 1:5
    m = 2*i -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;

        target1 = table.target1;
       
        figure(1)
        subplot(1,5,i)
        if mod(n,2)==0   
            plot(time,target1,'r','LineWidth',2);
        else 
            plot(time,target1,'b','LineWidth',2);
        end

        
        hold on
        xlim([0 10]);
        ylim([0 inf]);
        pbaspect([1 3 1]);
        set(gca, 'FontSize',10,'FontName','Times');
        xlabel('time (h)');
        ylabel('target1,target2');
        title(ttl(i))
    end
    for n = m:m+1
      
        target2 = table.target2;
         if mod(n,2)==0   
            plot(time,target2,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,target2,'b','LineWidth',2,LineStyle="--");
        end


    end
    legend(label);
end