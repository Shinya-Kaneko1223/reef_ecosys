clear
clf

ls = dir('*zphot1_his.csv');
ls2 = dir('*paper.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
color = {'Red','blue','Red','blue','Red','blue','Red','blue','Red','blue'};
label = {'28C F_ROS', '32C F_ROS','28C detox', '32C detox'};
for i = 1:5
    m = 2*i -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;

        F_ROS = table.F_ROS;
       
        figure(1)
        subplot(1,5,i)
        if mod(n,2)==0   
            plot(time,F_ROS,'r','LineWidth',2);
        else 
            plot(time,F_ROS,'b','LineWidth',2);
        end

        
        hold on
        xlim([0 10]);
        ylim([0 inf]);
        pbaspect([1 3 1]);
        set(gca, 'FontSize',10,'FontName','Times');
        xlabel('time (h)');
        ylabel('F_ROS,detox');
        title(ttl(i))
    end
    for n = m:m+1
      
        detox = table.detox;
         if mod(n,2)==0   
            plot(time,detox,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,detox,'b','LineWidth',2,LineStyle="--");
        end


    end
    legend(label);
end