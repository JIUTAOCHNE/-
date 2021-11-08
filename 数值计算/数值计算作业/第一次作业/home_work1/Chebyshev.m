function x=Chebyshev(n)  
for i=1:n+1
    x(i)=cos((2*(i-1)+1)*pi/(2*(1+n)));
end
end