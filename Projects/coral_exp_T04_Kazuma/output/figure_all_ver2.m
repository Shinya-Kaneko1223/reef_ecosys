clear
clf

fig_num = 6;
font = 12;
window = 1; 
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
       
        figure(window)
        subplot(fig_num,5,i)
        if mod(n,2)==0   
            plot(time,Fv_Fm,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,Fv_Fm,'b','LineWidth',2,LineStyle="--");
        end

        
        hold on
        xlim([0 10]);
        ylim([0 0.85]);
        pbaspect([1 1.5 1]);
        set(gca, 'FontSize',font,'FontName','Times');
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
    legend(label,'location','eastoutside');
end
% ========================J_ep_in==========================
k = 1;
for i = 1+k*5:5+k*5
    m = 2*(i-5*k) -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;
        target1 = table.J_ep_in;

        figure(window)
        subplot(fig_num,5,i)
        if mod(n,2)==0   
            plot(time,target1,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,target1,'b','LineWidth',2,LineStyle="--");
        end
        hold on

       
        ylim([0 0.0008]);
        xlim([0 10]);
        pbaspect([1 1.5 1]);
        set(gca, 'FontSize',font,'FontName','Times');
        ylabel('electron input [pmol/cell/s]')
        xlabel('time [h]')
       % title(ttl(i-k*5))
    end
    legend(label,'location','eastoutside');
end
%======================== ROS ================================

k = 2;
for i = 1+k*5:5+k*5
    m = 2*(i-5*k) -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;
        target1 = table.ROS;

        figure(window)
        subplot(fig_num,5,i)
         if mod(n,2)==0   
            plot(time,target1,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,target1,'b','LineWidth',2,LineStyle="--");
        end
        hold on

       
        ylim([0 275]);
        xlim([0 10]);
        pbaspect([1 1.5 1]);
        set(gca, 'FontSize',font,'FontName','Times');
        ylabel('ROS [pmol/cell/s]')
        xlabel('time [h]')
      %  title(ttl(i-k*5))
    end
    legend(label,'location','eastoutside');
end
%======================== ROS_slow ================================

k = 3;
for i = 1+k*5:5+k*5
    m = 2*(i-5*k) -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;
        target1 = table.ROS_slow;

        figure(window)
        subplot(fig_num,5,i)
         if mod(n,2)==0   
            plot(time,target1,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,target1,'b','LineWidth',2,LineStyle="--");
        end
        hold on

       
        ylim([0 275]);
        xlim([0 10]);
        pbaspect([1 1.5 1]);
        set(gca, 'FontSize',font,'FontName','Times');
        ylabel('ROS_slow [pmol/cell/s]')
        xlabel('time [h]')
      %  title(ttl(i-k*5))
    end
    legend(label,'location','eastoutside');
end
%======================== Pg ================================

k = 4;
for i = 1+k*5:5+k*5
    m = 2*(i-5*k) -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;
        target1 = table.Pg;

        figure(window)
        subplot(fig_num,5,i)
         if mod(n,2)==0   
            plot(time,target1,'r','LineWidth',2,LineStyle=":");
        else 
            plot(time,target1,'b','LineWidth',2,LineStyle="--");
        end
        hold on
       
        ylim([0 1e-4]);
        xlim([0 10]);
        pbaspect([1 1.5 1]);
        set(gca, 'FontSize',font,'FontName','Times');
        ylabel('Pg [pmol/cell/s]')
        xlabel('time [h]')
      %  title(ttl(i-k*5))
    end
    legend(label,'location','eastoutside');
end

%======================J_ep_in VcVo ================================
k = fig_num-1;
ls = dir('*zphot1_his.csv');
ls2 = dir('*paper.csv');
ttl = {'L0', 'L100', 'L250','L500','L1000'};
label = {'28C J_ep_in', '32C J_ep_in','28C Vc4Vo', '32C Vc4Vo'};
for i = 1+k*5:5+k*5
    m = 2*(i-k*5) -1;
    for n = m:m+1
        table = readtable(ls(n).name);
        time = table.time; 
        time  = time.*24;

        J_ep_in = table.J_ep_in;
       
        figure(window)
        subplot(fig_num,5,i)
        if mod(n,2)==0   
            plot(time,J_ep_in,'r','LineWidth',2);
        else 
            plot(time,J_ep_in,'b','LineWidth',2);
        end

        
        hold on
        xlim([0 10]);
        ylim([0 10e-4]);
        pbaspect([1 1.5 1]);
        set(gca, 'FontSize',font,'FontName','Times');
        xlabel('time (h)');
        ylabel('J_ep_in,Vc4Vo');
      %  title(ttl(i-k*5))
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
    legend(label,'location','eastoutside');
end