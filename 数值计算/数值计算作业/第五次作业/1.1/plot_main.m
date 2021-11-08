x=-1:0.01:1;
y=sin(10*x)-exp(-x).*x-x;
plot(x,y,'-m',...
            'LineWidth',2.5);
legend("\fontsize{20}\itf（x）\bf在区间[-1 1]内的图像");