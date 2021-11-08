%%由第一问绘制的函数图像大致得出：f（x）的有根区间为：[-0.4 -0.2];[-0.2 0.2];[0.2 0.4].

%1.计算二分区间测次数
x0=[-0.4 -0.2 0.2 0.4];
error=ones(3,1);
sigma=1e-8;
k=zeros(3,1);        %计算三个区间需要二分的次数
for i=1:3
    j=1;
    while(error(i)>sigma)
        error(i)=(x0(i+1)-x0(i))/2^(j+1);
        j=j+1;
    end
    k(i)=j;
end
fprintf("二分次数分别为：%d;%d;%d\n",k(1),k(2),k(3));
        
xk=zeros(3,1);           %最后输出的xk就是我们要求的xk（3个）

for i=1:3
    K=1;
    if(i==2)              %中间区间的根值符号恰好相反
        while(K<k(i))
            xk(i)=(x0(i+1)+x0(i))/2;
            a=fun(xk(i));
            if(a>0)
                x0(i+1)=xk(i);
            elseif(a<0)
                x0(i)=xk(i);
            end
            K=K+1;
        end        
    else
        while(K<k(i))
            xk(i)=(x0(i+1)+x0(i))/2;
            a=fun(xk(i));
            if(a>0)
                x0(i)=xk(i);
            elseif(a<0)
                x0(i+1)=xk(i);
            end
            K=K+1;
        end
    end
end             
%perfect!!

fprintf("三个二分近似根分别为：%.9f;%.9f;%.9f\n",xk(1),xk(2),xk(3));

%计算二分法求出的近似根处对应的函数值
yk=zeros(3,1);

for i=1:3
    yk(i)=fun(xk(i));
end
fprintf("三个二分近似根对应的函数值：%.9f;%.9f;%.9f\n",yk(1),yk(2),yk(3));
    
    
