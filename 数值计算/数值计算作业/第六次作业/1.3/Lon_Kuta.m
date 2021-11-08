%%经典-库塔四阶方法--P187页
%%Notice
%注：本题中的f函数过于简单
h=[0.1 0.05];
for j=1:2
    x=0:h(j):1;
    k(j)=length(x);
    if(j==1) 
        u1=zeros(k(j),1);      %算第一个维度的迭代
        for i=1:k(j)
            if(i==1)
                u1(1)=1;
            else
                k1=f_func(u1(i-1));
                k2=f_func(u1(i-1)+h(j)*k1/3);
                k3=f_func(u1(i-1)-h(j)*k1/3+h(j)*k2);            %经典库塔四阶公式
                k4=f_func(u1(i-1)+h(j)*k1-h(j)*k2+h(j)*k3);
                u1(i)=u1(i-1)+h(j)*(k1+3*k2+3*k3+k4)/8;      
            end
        end
    else
        u2=zeros(k(j),1);      %算第一个维度的迭代
        for i=1:k(j)
            if(i==1)
                u2(1)=1;
            else
                k1=f_func(u2(i-1));
                k2=f_func(u2(i-1)+h(j)*k1/3);
                k3=f_func(u2(i-1)-h(j)*k1/3+h(j)*k2);            %经典库塔四阶公式
                k4=f_func(u2(i-1)+h(j)*k1-h(j)*k2+h(j)*k3);
                u2(i)=u2(i-1)+h(j)*(k1+3*k2+3*k3+k4)/8;    
            end
        end  
    end  
end

%%求解微分方程的真实值
X=0:0.01:1.2;
Y=exp(-20*X);
plot(X,Y,'-m',...
            'LineWidth',4);
axis([0,1.2 -1.2,1.2]);
hold on;
x=0:0.1:1;
plot(x,u1,'-.o',...
            'LineWidth',2,...
            'MarkerFaceColor','k',...%[0.49 1 0.63],...
            'MarkerEdgeColor','b',...
            'MarkerSize',10);        %数据标签大小 ););
hold on;
x2=0:0.05:1;
plot(x2,u2,'m^',...
            'LineWidth',2,...
            'MarkerFaceColor','k',...%[0.49 1 0.63],...
            'MarkerEdgeColor','g',...
            'MarkerSize',10);        %数据标签大小 );
 legend('\fontsize{15}原函数图像','\fontsize{15}h=0.1数值解',...
       '\fontsize{15}h=0.05数值解');
        
%结果显示，使用经典库塔函数后，效果比改进的欧拉好很多，且步长取0.05的效果越好， 
