K=10;   %设置初始迭代次数  
W=200;   %设置矩阵维数   %若想看其他维数的矩阵迭代情况，修改10为20..即可
error=1;
sigma=1e-8;
%%以10维度的矩阵为例
while(error>=sigma)
    C=jacobi(K,W);     
    deta=C(:,K)-C(:,K-1);
    error=max(abs(deta));     %计算迭代精度
    K=K+1;
end
K=K-1;  %区分迭代次数与矩阵维数的关系，第一列为初始序列，是没有迭代的
fprintf("迭代次数为：%d\n",K);
fprintf("且误差为：%d\n",error);


%Jacobi迭代矩阵计算
A=Matri(W);    
D=zeros(W,W);
L=zeros(W,W);
U=zeros(W,W);

for i=1:W-1    
    U(i,i+1)=A(i,i+1);    %初始化上三角矩阵
end

for i=2:W
    L(i,i-1)=A(i,i-1);     %初始化下三角矩阵
end


for i=1:W
    D(i,i)=A(i,i);          %初始化对角矩阵
end

G_j=inv(D)*(L+U);
E=abs(eig(G_j));     %计算迭代矩阵的特征值的绝对值
radi=max(E);
fprintf("Jacobi 迭代举证的谱半径为：%d\n",radi);



    
    
    