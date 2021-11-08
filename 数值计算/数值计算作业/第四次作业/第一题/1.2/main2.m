load('matri_B.mat');

%%求解平方根L矩阵
L=zeros(10,10);
L(1,1)=sqrt(B(1,1));
for i=2:10
    L(i,1)=B(i,1)/L(1,1);
end

for i=2:10
    for j=2:i
        if(j==i)
            Sum1=0;
            for k=1:i-1
                Sum1=Sum1+L(i,k)*L(i,k);
            end
            L(i,i)=sqrt(B(i,i)-Sum1);
        else
            Sum2=0;
            for k=1:i-1
                Sum2=Sum2+L(i,k)*L(j,k);
            end
            L(i,j)=(B(i,j)-Sum2)/L(j,j);
        end
    end
end
%%求解平方根L矩阵


C=round(L*L'); %取整验证 
if(C==B)       
    disp("平当根法分解正确")  %检验LU分解正确与否
end

%%求解Ly=b；L'x=y
x=zeros(10,1);
y=zeros(10,1);
b=ones(10,1);

y(1)=b(1)/L(1,1);
for i=2:10
    Sum3=0;
    for j=1:i-1
        Sum3=Sum3+L(i,j)*y(j);
    end
    y(i)=(b(i)-Sum3)/L(i,i);
end

x(10)=y(10)/L(10,10);
for i=9:-1:1
    Sum4=0;
    for j=i+1:10
        Sum4=Sum4+L(j,i)*x(j);
    end
    x(i)=(y(i)-Sum4)/L(i,i);
end

%%计算误差
erro=b-B*x; 
Inf_norm=max(abs(erro));
disp(Inf_norm);