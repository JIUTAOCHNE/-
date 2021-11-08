function Itera_mat = Gauss_Seidel(W,G)
%G--������������
%W-ѡ�ľ���ά��
[A,b]=Matri(W);
Itera_mat=zeros(W,G);
for i=1:W  
    Itera_mat(i,1)=0.999998;
end
for j=2:G    %���������ò�����������ĺ�������  j--��
    for i=1:W     %W--��
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

