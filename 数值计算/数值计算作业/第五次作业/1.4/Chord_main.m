%同第三问类似：弦截法需要两个初始点x来启动迭代，而我们一般通过牛顿法迭代一次获取第二个点
%并利用这两个初始点进行迭代

x0=[-0.2 0.05 0.2];        %同第3问，设置合理的启动值
error=1;j=1;
sigma=1e-8;
xk(1)=x0(3);                    %改这里的x0(1),把1->2->3即可
xk(2)=xk(1)-fun(xk(1))/def_fun((xk(1)));     %先利用一次Newton迭代计算第二个初始值
j=2;
while(error>sigma)
    xk(j+1)=xk(j)-fun(xk(j))*(xk(j)-xk(j-1))/(fun(xk(j))-fun(xk(j-1)));
    error=abs(xk(j+1)-xk(j));
    j=j+1;    
end
result=fun(xk(j));
fprintf("Netwon迭代只需迭代： %d次达到精度\n",j);
fprintf("且迭代的根为:    %.6f\n",xk(j));
fprintf("且迭代的函数值:");
disp(result);