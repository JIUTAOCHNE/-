%%分析--取向前差分的Euler法迭代，求解微分方程--P175页-结合公式，进行迭代即可
h=[0.1 0.05];
for j=1:2
    x=0:h(j):1;
    k(j)=length(x);
    if(j==1)
        u1=zeros(k(j),1);
        for i=1:k(j)
            if(i==1)
                u1(1)=1;
            else
                u1(i)=u1(i-1)+h(j)*f_func(u1(i-1));
            end
        end
    else
        u2=zeros(k(j),1);
        for i=1:k(j)
            if(i==1)
                u2(1)=1;
            else
                u2(i)=u2(i-1)+h(j)*f_func(u2(i-1));
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
        
%%发现误差还是比较打大的
        