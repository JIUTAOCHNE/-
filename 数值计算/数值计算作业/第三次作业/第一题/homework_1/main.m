n=50;  %�ȷֳ�50�ȷ�
sigam=1e-6;  %�����
error=1;     %�趨��ʼ���
%%���������ʵֵ
fun = @(x) exp(x).*cos(x);
value = integral(fun,0,pi);

while(error>=sigam)
  Sum=0;
  h=pi/n;
  x=linspace(0,pi,n+1);   %n+1����--n�ȷ�
  for i=1:n
    Sum=Sum+func(x(i),x(i+1),h/2);
  end
  n=n+1;
  error=abs(value-Sum);
end
a=n-1;
fprintf("���������������ֵΪ��%.6f\n�ȷִ���Ϊ: %d\n",Sum,a);