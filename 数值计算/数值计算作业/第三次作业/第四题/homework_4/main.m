Gauss_coeff=[5/9 8/9];
Gauss_vari=[-0.7745967 0.7745967 0];
Gauss_leg_val1=Gauss_coeff(1)*Gauss_Leg1(Gauss_vari(1))+...  %计算前段区间的三点Gauss_Leg值
    Gauss_coeff(1)*Gauss_Leg1(Gauss_vari(2))+...
    Gauss_coeff(2)*Gauss_Leg1(Gauss_vari(3));
Gauss_leg_val2=Gauss_coeff(1)*Gauss_Leg2(Gauss_vari(1))+...    %计算后段区间的三点Gauss_Leg值
    Gauss_coeff(1)*Gauss_Leg2(Gauss_vari(2))+...
    Gauss_coeff(2)*Gauss_Leg2(Gauss_vari(3));
Gauss_leg_val=Gauss_leg_val1+Gauss_leg_val2;    %计算三点Gauss_Leg值--对前面的求和
fprintf("利用分段三点Gauss-Legendre公式计算积分近似为：%.6f\n",Gauss_leg_val);
