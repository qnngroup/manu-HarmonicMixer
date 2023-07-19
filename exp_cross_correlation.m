% inputs = gate(time, deltaI), signal(time, deltaI), workfunction.
% outputs = time vector and total (cross-correlation vector)
workfunction=5.1; %workfunction of material
originalGatex=0; %gate time data
originalGatey=0; %gate deltaI data
originalSignalx=0;%signal time data
originalSignaly=0;%signal deltaI data


originalGatey=originalGatey./max(originalGatey);
originalSignaly=originalSignaly./max(originalSignaly);
dt_shortertime=abs(mean(diff(originalGatex)));
padded_shortergate_time=[-600:dt_shortertime:min(originalGatex)-dt_shortertime (originalGatex)' max(originalGatex)+dt_shortertime:dt_shortertime:600+dt_shortertime];
padnum=numel(padded_shortergate_time)-numel(originalGatex);

dt_shortertime_signal=mean(diff(originalSignalx));
pad_equal_to_gate=numel(padded_shortergate_time)-(numel(originalSignalx)); %assumes that the number will always be even
padded_shorterCP_time=zeros(1,numel(padded_shortergate_time));
new_temp=originalSignalx'-50;
for i=1:pad_equal_to_gate/2
    old_temp=new_temp;
    new_temp=[-1*dt_shortertime_signal+old_temp(1) old_temp 1*dt_shortertime_signal+old_temp(end)];
end
padded_signal_time=new_temp;
padded_signaly=[zeros(1,pad_equal_to_gate/2) originalSignaly' zeros(1,pad_equal_to_gate/2)];
time=0;total=0;cc=0;
for i=1:(numel(padded_shortergate_time)-numel(originalGatex)-1)
    gate=zeros(1,numel(padded_shortergate_time));
    gate(i:numel(originalGatex)+i-1)=originalGatey;
    time(i)=padded_shortergate_time(i);
    total(i)=sum(J_FN_SI_Asym((30.*gate)+(1/30)*(padded_signaly),workfunction));
    cc(i)=trapz(padded_shortergate_time,(1.*gate).*(padded_signaly.*1));
end
total=total-total(1);