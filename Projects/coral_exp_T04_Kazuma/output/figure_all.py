import os
import pandas as pd
import matplotlib.pyplot as plt


plt.clf()

fig_num = 6
font = 12
window = 1
ls = [file for file in os.listdir() if file.endswith('zphot1_his.csv')]
sorted(ls)
ls2 = [file for file in os.listdir() if file.endswith('paper.csv')]
sorted(ls2)
ttl = ['L0', 'L100', 'L250', 'L500', 'L1000']
colors = ['Red', 'blue', 'Red', 'blue', 'Red', 'blue', 'Red', 'blue', 'Red', 'blue']
labels = ['28C modeled', '32C modeled', '28C measured', '32C measured']

print(ls)

for i in range(1, 5):
    m = 2 * i - 1
    for n in range(m, m + 1):
        table = pd.read_csv(ls[n])
        print(table.columns)
        time = table['time'] * 24
        print(time)
        target = table[' FvFm']

        plt.figure(window)
        plt.subplot(fig_num, 5, i)
        if n % 2 == 0:
            plt.plot(time, target, 'r', linewidth=2, linestyle=":")
        else:
            plt.plot(time, target, 'b', linewidth=2, linestyle="--")

        hold(True);
        plt.xlim([0, 10])
        plt.ylim([0, 0.85])
        plt.gca().set_aspect(1.5)
        plt.xticks(fontsize=font)
        plt.yticks(fontsize=font)
        plt.xlabel('time (h)', fontsize=font)
        plt.ylabel('FvFm', fontsize=font)
        plt.title(ttl[i], fontsize=font)

    for n in range(m, m + 1):
        table2 = pd.read_csv(ls2[n])
        print(table2.columns)
        time2 = table2['time ']
        FvFm2 = table2['Fv_Fm ']
        if n % 2 == 0:
            plt.scatter(time2, FvFm2, color='Red', marker='o')
        else:
            plt.scatter(time2, FvFm2, color='b', marker='o')

    plt.legend(labels, loc='best')

# ========================J_ep_in==========================
k = 1
for i in range(1 + k * 5, 5 + k * 5):
    m = 2 * (i - 5 * k) - 1
    for n in range(m, m + 1):
        table = pd.read_csv(ls[n])
        time = table['time'] * 24
        target1 = table[' J_ep_in']

        plt.figure(window)
        plt.subplot(fig_num, 5, i)
        if n % 2 == 0:
            plt.plot(time, target1, 'r', linewidth=2, linestyle=":")
        else:
            plt.plot(time, target1, 'b', linewidth=2, linestyle="--")

        hold(True)
        plt.ylim([0, 0.0008])
        plt.xlim([0, 10])
        plt.gca().set_aspect(1.5)
        plt.xticks(fontsize=font)
        plt.yticks(fontsize=font)
        plt.ylabel('electron input [pmol/cell/s]', fontsize=font)
        plt.xlabel('time [h]', fontsize=font)

    plt.legend(labels, loc='best')

# ======================== ROS ================================
k = 2
for i in range(1 + k * 5, 5 + k * 5):
    m = 2 * (i - 5 * k) - 1
    for n in range(m, m + 1):
        table = pd.read_csv(ls[n])
        time = table['time'] * 24
        target1 = table[' ROS']

        plt.figure(window)
        plt.subplot(fig_num, 5, i)
        if n % 2 == 0:
            plt.plot(time, target1, 'r', linewidth=2, linestyle=":")
        else:
            plt.plot(time, target1, 'b', linewidth=2, linestyle="--")

        hold(True)
        plt.ylim([0, 275])
        plt.xlim([0, 10])
        plt.gca().set_aspect(1.5)
        plt.xticks(fontsize=font)
        plt.yticks(fontsize=font)
        plt.ylabel('ROS [pmol/cell/s]', fontsize=font)
        plt.xlabel('time [h]', fontsize=font)

    plt.legend(labels, loc='best')

# ======================== ROS_slow ================================
k = 3
for i in range(1 + k * 5, 5 + k * 5):
    m = 2 * (i - 5 * k) - 1
    for n in range(m, m + 1):
        table = pd.read_csv(ls[n])
        time = table['time'] * 24
        target1 = table[' ROS_slow']

        plt.figure(window)
        plt.subplot(fig_num, 5, i)
        if n % 2 == 0:
            plt.plot(time, target1, 'r', linewidth=2, linestyle=":")
        else:
            plt.plot(time, target1, 'b', linewidth=2, linestyle="--")

        hold(True)
        plt.ylim([0, 275])
        plt.xlim([0, 10])
        plt.gca().set_aspect(1.5)
        plt.xticks(fontsize=font)
        plt.yticks(fontsize=font)
        plt.ylabel('ROS_slow [pmol/cell/s]', fontsize=font)
        plt.xlabel('time [h]', fontsize=font)

    plt.legend(labels, loc='best')

# ======================== Pg ================================
k = 4
for i in range(1 + k * 5, 5 + k * 5):
    m = 2 * (i - 5 * k) - 1
    for n in range(m, m + 1):
        table = pd.read_csv(ls[n])
        time = table['time'] * 24
        target1 = table[' Pg']

        plt.figure(window)
        plt.subplot(fig_num, 5, i)
        if n % 2 == 0:
            plt.plot(time, target1, 'r', linewidth=2, linestyle=":")
        else:
            plt.plot(time, target1, 'b', linewidth=2, linestyle="--")

        hold(True)
        plt.ylim([0, 1e-4])
        plt.xlim([0, 10])
        plt.gca().set_aspect(1.5)
        plt.xticks(fontsize=font)
        plt.yticks(fontsize=font)
        plt.ylabel('Pg [pmol/cell/s]', fontsize=font)
        plt.xlabel('time [h]', fontsize=font)

    plt.legend(labels, loc='best')

# =======================J_ep_in VcVo ================================
k = fig_num - 1
ttl = ['L0', 'L100', 'L250', 'L500', 'L1000']
labels = ['28C J_ep_in', '32C J_ep_in', '28C Vc4Vo', '32C Vc4Vo']

for i in range(1 + k * 5, 5 + k * 5):
    m = 2 * (i - k * 5) - 1
    for n in range(m, m + 1):
        table = pd.read_csv(ls[n])
        time = table['time'] * 24

        J_ep_in = table[' J_ep_in']

        plt.figure(window)
        plt.subplot(fig_num, 5, i)
        if n % 2 == 0:
            plt.plot(time, J_ep_in, 'r', linewidth=2)
        else:
            plt.plot(time, J_ep_in, 'b', linewidth=2)

        hold(True)
        plt.xlim([0, 10])
        plt.ylim([0, 10e-4])
        plt.gca().set_aspect(1.5)
        plt.xticks(fontsize=font)
        plt.yticks(fontsize=font)
        plt.xlabel('time (h)', fontsize=font)
        plt.ylabel('J_ep_in,Vc4Vo', fontsize=font)

    for n in range(m, m + 1):
        table = pd.read_csv(ls[n])
        Vc4Vo = table[' Vc4Vo']
        if n % 2 == 0:
            plt.plot(time, Vc4Vo, 'r', linewidth=2, linestyle=":")
        else:
            plt.plot(time, Vc4Vo, 'b', linewidth=2, linestyle="--")

    plt.legend(labels, loc='best')

plt.show()
