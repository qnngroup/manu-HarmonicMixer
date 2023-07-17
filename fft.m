function [f,Af_num]=fftout(t,FN_current)
N=numel(t);
T=abs(min(t))+max(t);
dt=1*T/N;
time=-T:dt:T-dt;
Fs=1/dt;
df=1/T; % or Fs/N
f=-Fs/2:df:Fs/2-df;
f=f';
Af_num=fftshift(dt*fft(ifftshift(FN_current)));
end