function [A,b]=Matri(n)
A=zeros(n,n);
b=zeros(n,1);
b(1)=1;
b(n)=1;
for i=1:n
    A(i,i)=2;
end
for i=2:n
    A(i,i-1)=-1;
end
for i=1:n
    for j=1:n
        A(i,j)=A(j,i);
    end
end

end

