%%Notice
%改进欧拉法使用求数值解时，如果每步只迭代一次，
%y_{n+1} 的一个初步近似值y_{n+1} ，称为预测值，然后用梯形公式校正求得近似值
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
                yp=u1(i-1)+h(j)*f_func(u1(i-1));
                yq=u1(i-1)+h(j)*f_func(yp);  %矫正
                u1(i)=(yp+yq)/2;      
            end
        end
    else
        u2=zeros(k(j),1);      %算第一个维度的迭代
        for i=1:k(j)
            if(i==1)
                u2(1)=1;
            else
                yp=u2(i-1)+h(j)*f_func(u2(i-1));
                yq=u2(i-1)+h(j)*f_func(yp);  %矫正
                u2(i)=(yp+yq)/2;  
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
legend;
hold on;
x2=0:0.05:1;
plot(x2,u2,'m^',...
            'LineWidth',2,...
            'MarkerFaceColor','k',...%[0.49 1 0.63],...
            'MarkerEdgeColor','g',...
            'MarkerSize',10);        %数据标签大小 );
        
%结果显示，使用改进的Euler后，步长取0.05的效果越好 
