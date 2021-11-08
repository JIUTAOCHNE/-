function result = Simpson(x1,x2,h)
x_half=(x1+x2)/2;
result=(exp(x1)*cos(x1)+4*exp(x_half)*cos(x_half)+exp(x2)*cos(x2))*h/6;
end

