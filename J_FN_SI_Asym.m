function J=J_FN_SI_Asym(F, phi)

J=zeros(1,length(F));
%F = -1*F;
for i=1:length(F)
    if F(i)>0
        a_const = 1.541534e-6;
        b_const = 6.83089;
        f = 1.43996453529595*F(i)/phi.^2;
        v_f = 1;%1 - f + 1/6.*f.*log(abs(f)); %simplified FN
        J(i) = a_const/phi*F(i).^2*exp(-v_f*b_const*phi.^(3/2)/F(i));
        threshold=-v_f*b_const*phi.^(3/2);
    else
        J(i)=0;
    end
end