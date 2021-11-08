function p= lagr_fun(x,y,x0)
%x，y--原节点数据的坐标
%x0--运用插值要计算的点横坐标
n=length(x);
l=ones(1,n);
%根据拉格朗日插值公式含义写出其基函数
for i=1:n
    for j=1:n
        if i~=j
            l(i)=l(i)*(x0-x(j))/(x(j)-x(i));
        end
    end
end
p=sum(l.*y);   
end