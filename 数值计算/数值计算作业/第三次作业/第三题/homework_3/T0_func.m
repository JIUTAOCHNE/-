function result = T0_func(k)
Sum=0;
a=2^(k-1)-1;
for j=0:a
    Sum=Sum+func((2*j+1)*pi/2^k);  
end
result=Sum*pi/2^k;
end

