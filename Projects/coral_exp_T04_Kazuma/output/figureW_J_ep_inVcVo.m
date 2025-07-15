clear
clf

ls = dir('*zphot1_his.csv');
ls2 = dir('*paper.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
color = {'Red','blue','Red','blue','Red','blue','Red','blue','Red','blue'};
label = {'28C J_ep_in', '32C J_ep_in','28C Vc4Vo', '32C Vc4Vo'};
for i = 1:5
    m = 2*i -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;

        J_ep_in = table.J_ep_in;
       
        figure(1)
        subplot(1,5,i)
        if mod(n,2)==0   
            plot(time,J_ep_in,'r','LineWidth',2);
        else 
            plot(time,J_ep_in,'b','LineWidth',2);
        end

        
        hold on
        xlim([0 10]);
        ylim([0 0.0003]);
        pbaspect([1 3 1]);
        set(gca, 'FontSize',10,'FontName','Times');
        xlabel('time (h)');
        ylabel('J_ep_in,Vc4Vo');
        title(ttl(i))
    end
    for n = m:m+1
        table = readtable(ls(n).name);
        Vc4Vo = table.Vc4Vo;
         if mod(n,2)==0   
            plot(time,Vc4Vo,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,Vc4Vo,'b','LineWidth',2,LineStyle="--");
        end


    end
    legend(label);
end