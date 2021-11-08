%Notice1：牛顿迭代误差精度在编程中用 |X(K+1)-X(K)|进行估算
%Notice2: 对于选取合适的初始值x0来启动迭代，应当尽量靠近其真实根所在位置
%由第二问计算可得到结果可知f(x)有三个根，且根据他们的值，初步设定三个根为:x1=-0.2 ;x2=0.1; x3=0,2,
%根据这三个初始值，启动Newton迭代

x0=[-0.2 0.05 0.2];
error=1;j=1;
sigma=1e-8;
xk(1)=x0(3);  %改这里的x0(1),把1->2->3即可
while(error>sigma)
    xk(j+1)=xk(j)-fun(xk(j))/def_fun((xk(j)));
    error=abs(xk(j+1)-xk(j));
    j=j+1;    
end
result=fun(xk(j));
fprintf("Netwon迭代只需迭代：%d次达到精度\n",j);
fprintf("且迭代的根为: ");
disp(xk(j));
fprintf("迭代根的函数值为:");
disp(result);
