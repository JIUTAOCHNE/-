%%重构目标矩阵
    A=zeros(10,10);
    A(1,1)=9;
    A(10,10)=1;
    A(9,9)=5;
    A(10,9)=-2;
    for i=2:9
        A(i,i-1)=-4;
    end
    for i=3:10
        A(i,i-2)=1;
    end
    
    for i=1:10
        for j=1:10
            A(i,j)=A(j,i);
        end
    end
    
for i=2:8
    A(i,i)=6;
end