yc=1.69;%center wavlength in micron
c=2.99792458e8 ;
wc=2*pi*c*1e-15./(yc*1e-6);
t=linspace(-100,100,50000); %time axis
cycle_count = yc * (1e-6) / (c * 1e-15); 
fwhm=cycle_count*10; %cycle count of pulse
phi_ce=0; %carrier envelope phase of pulse
GDD=0;
TOD=0;
FOD=0;
workfunction=5.1; %workfunction of gold
pulse=gaussianPulseHOD(t,fwhm,wc,phi_ce,GDD,TOD,FOD);
FNBW=dJ_FN_SI_Asym(pulse*32,workfunction); %derivative of the FN to get the taylor expanded frequecny bandwidth

%use J_FN_SI_Asym(pulse,workfunction) for getting time domain electron
%emission rate

[f,Af]=fftout(t,FNBW);
nAf=Af./max(Af)';
f=f';
plot(f,nAf) 
axis([0 2 0 1])