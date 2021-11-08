function Itera_mat = Gauss_Seidel(W,G)
%G--迭代次数参数
%W-选的矩阵维数
[A,b]=Matri(W);
Itera_mat=zeros(W,G);
for i=1:W  
    Itera_mat(i,1)=0.999998;
end
for j=2:G    %在这里设置参数，作后面的函数调用  j--列
    for i=1:W     %W--行
        SUM=0;
        if(i==1)
            for k=2:W
                SUM=SUM-A(i,k)*Itera_mat(k,j-1);
            end
            Itera_mat(1,j)=(SUM+b(1))/A(1,1);
        else
            for L=1:i-1
                SUM=SUM-A(i,L)*Itera_mat(L,j);
            end
            for L=i+1:W
                SUM=SUM-A(i,L)*Itera_mat(L,j-1);
            end
            Itera_mat(i,j)=(SUM+b(i))/A(i,i);
        end
    end
end

end

