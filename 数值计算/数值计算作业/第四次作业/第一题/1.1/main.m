
load('matri_A.mat');
b=ones(100,1);

%%构建L U矩阵
U=zeros(100,100);
for i=1:100
    U(1,i)=A(1,i);
end

L=zeros(100,100);

for i=1:100
    L(i,i)=1;
end


for i=2:100
    L(i,1)=A(i,1)/U(1,1);
end

for k=2:100
    for j=k:100
        Sum1=0;
        for i=1:k-1
            Sum1=Sum1+L(k,i)*U(i,j);
        end
        U(k,j)=A(k,j)-Sum1;
    end
    for i=k+1:100
        Sum2=0;
        for j=1:k-1
            Sum2=Sum2+L(i,j)*U(j,k);
        end
        L(i,k)=(A(i,k)-Sum2)/U(k,k);   %L的第K列
    end
end
%%构建L U矩阵

C=round(L*U); %取整验证 
if(C==A)       
    disp("LU分解正确")  %检验LU分解正确与否
end

%%求解三角方程组Ly=b；Ux=y；
%求解y
y=zeros(100,1);
x=zeros(100,1);
y(1)=b(1);
for i=2:100
    Sum3=0;
    for k=1:i-1
        Sum3=Sum3+L(i,k)*y(k);
    end
    y(i)=b(i)-Sum3;
end


%求解X
x(100)=y(100)/U(100,100);
for i=99:-1:1
    Sum4=0;
    for k=i+1:100
        Sum4=Sum4+U(i,k)*x(k);
    end
    x(i)=(y(i)-Sum4)/U(i,i);
end

%%计算误差
erro=b-A*x; 
Inf_norm=max(abs(erro));
disp(Inf_norm);




