n=50;  %先分成50等份
sigam=1e-6;  %误差限
error=1;     %设定初始误差
%%计算积分真实值
fun = @(x) exp(x).*cos(x);
value = integral(fun,0,pi);

while(error>=sigam)
  Sum=0;
  h=pi/n;
  x=linspace(0,pi,n+1);   %n+1个点--n等分
  for i=1:n
    Sum=Sum+func(x(i),x(i+1),h/2);
  end
  n=n+1;
  error=abs(value-Sum);
end
a=n-1;
fprintf("复化梯形求积近似值为：%.6f\n等分次数为: %d\n",Sum,a);