%%绘制数据散点图
x=[88.9 108.5 104.1 139.7 127 94 116.8 99.1];
y=[14.6 16.7 15.3 23.2 19.5 16.1 18.1 16.6];
scatter(x,y,60,'red','filled');
xlabel('\fontsize{15}降水量(cm)');
ylabel('\fontsize{15}流速(m^2/s)');
legend('\fontsize{15}原始数据');