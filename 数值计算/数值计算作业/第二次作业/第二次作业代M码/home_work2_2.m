%%利用直线对数据进行最小二乘法拟合
x=[88.9 108.5 104.1 139.7 127 94 116.8 99.1];
y=[14.6 16.7 15.3 23.2 19.5 16.1 18.1 16.6];
scatter(x,y,60,'red','filled');
hold on;
xlabel('\fontsize{15}降水量(cm)');
ylabel('\fontsize{15}流速(m^2/s)')
%利用直线最小二乘拟合--求法方程--y=a+b*x
m=length(x);
A=zeros(m,2);    %2--两个未知数
A(:,1)=ones(m,1);  %构造发方程矩阵
A(:,2)=x';
B=(A')*A;
Y=A'*(y');
a=B\Y;

%最小二乘法拟合函数   
xx=80:0.05:150;
yy=a(1)+a(2)*xx;   %y=0.842782613203118+0.15187078817261×x；
plot(xx,yy,'-b','LineWidth',2);
legend('\fontsize{15}原始数据','\fontsize{15}直线拟合');
