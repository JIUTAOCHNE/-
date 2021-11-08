function Itera_mat=jacobi(G,w)   
%G--迭代次数参数
%w-选的矩阵维数
[A,b]=Matri(w);
Itera_mat=zeros(w,G);
for i=1:w  
    Itera_mat(i,1)=0.999998;
end
for j=2:G    %在这里设置参数，作后面的函数调用
    for i=1:w
        SUM=0;
        for k=1:w
            SUM=SUM+(-A(i,k)*Itera_mat(k,j-1));
        end
        SUM=SUM+b(i)+A(i,i)*Itera_mat(i,j-1);     %多减了一个补回去
        Itera_mat(i,j)=SUM/A(i,i);
    end
end
end       


