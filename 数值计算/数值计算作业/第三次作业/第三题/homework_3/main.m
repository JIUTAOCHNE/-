sigam=1e-6;  %误差限
error=1;     %设定初始误差
T0_0=pi/2*(func(pi)+func(0));
A=zeros(5,5);  %创建空矩阵，承接
A(1,1)=T0_0;
err=1e-6;

for i=2:5
    A(i,1)=T0_func(i-1)+A(i-1,1)/2;   %计算第一列的通式--注意是T0_func(i-1)，矩阵从1开始
end

for j=2:5
    for i=j:5
        A(i,j)=4^(j-1)/(4^(j-1)-1)*A(i,j-1)-1/(4^(j-1)-1)*A(i-1,j-1);
    end
    error=A(i,j)-A(i,j-1);

end
    if(error<=err)
        fprintf("满足误差进度，且龙贝格计算结果近似为：%.6f\n",A(i,j))
    end

