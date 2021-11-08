%%重构目标矩阵
%     A=zeros(1000,1000);
%     A(1,1)=9;
%     A(1000,1000)=1;
%     A(999,999)=5;
%     A(1000,999)=-2;
%     for i=2:999
%         A(i,i-1)=-4;
%     end
%     for i=3:1000
%         A(i,i-2)=1;
%     end
%     
%     for i=1:1000
%         for j=1:1000
%             A(i,j)=A(j,i);
%         end
%     end
%     
% for i=2:998
%     A(i,i)=6;
% end

load('matri_B.mat');
b=ones(1000,1);

%%构建L U矩阵
U=zeros(1000,1000);
for i=1:1000
    U(1,i)=B(1,i);
end

L=zeros(1000,1000);

for i=1:1000
    L(i,i)=1;
end


for i=2:1000
    L(i,1)=B(i,1)/U(1,1);
end

for k=2:1000
    for j=k:1000
        Sum1=0;
        for i=1:k-1
            Sum1=Sum1+L(k,i)*U(i,j);
        end
        U(k,j)=B(k,j)-Sum1;
    end
    for i=k+1:1000
        Sum2=0;
        for j=1:k-1
            Sum2=Sum2+L(i,j)*U(j,k);
        end
        L(i,k)=(B(i,k)-Sum2)/U(k,k);   %L的第K列
    end
end
%%构建L U矩阵

C=round(L*U); %取整验证 
if(C==B)       
    disp("LU分解正确"); %检验LU分解正确与否
end

%%求解三角方程组Ly=b；Ux=y；
%求解y
y=zeros(1000,1);
x=zeros(1000,1);
y(1)=b(1);
for i=2:1000
    Sum3=0;
    for k=1:i-1
        Sum3=Sum3+L(i,k)*y(k);
    end
    y(i)=b(i)-Sum3;
end


%求解X
x(1000)=y(1000)/U(1000,1000);
for i=999:-1:1
    Sum4=0;
    for k=i+1:1000
        Sum4=Sum4+U(i,k)*x(k);
    end
    x(i)=(y(i)-Sum4)/U(i,i);
end

erro=b-B*x; 
Inf_norm=max(abs(erro));
disp(Inf_norm);