clear all;close all;clc
%Nombre='120000_lockin.txt';
mkdir 'Resonance'
path='C:\Users\Julio\Desktop\Final_data_Julio\Resonance';
txtResonancia='Resonance_NSG30.txt';

%fileID=fopen(Nombre,'r');
fileID2=fopen(txtResonancia,'r');


sizA=[2 inf];
sizB=[2 inf];
D=fscanf(fileID2,'%f',sizB);
D=D';

frequency=D(:,1);
Voltage=D(:,2);

plot(frequency,Voltage);

Voltage=abs(Voltage);
dbout=db(Voltage);
[max_voltage,x_max]=max(Voltage);
T=find(Voltage>(1/sqrt(2))*max(Voltage));
figure();
plot(frequency(T),Voltage(T));
% 
% Db=10*log10(Voltage./max(Voltage));
Db=mag2db(Voltage);

[maximo,pos]=max(Db);
max3=maximo-3;


[a1,b1]=min(abs(Db(1:end/2)-max3));

[a2,b2]=min(abs(Db(end/2:end)-max3));

A=find(Db>max3);
figure();
plot(frequency,Db);

bandwidth=max(frequency(A(:)))-min(frequency(A(:)));

G=zeros(numel(frequency),2);

G(:,1)=frequency;
G(:,2)=Voltage;


filename = [txtResonancia] ;   % text file name 
file = [path filesep filename] ;  % make filename  with path 

save(file,'G','-ascii','-double')
%Escribir expresion para el factor de calidad 

% A=fscanf(fileID,'%f',sizA);
% A=A';
% Tam=size(A);
% Columnax=input('Numero de columna x ');
% Columnay=input('Numero de Columna y ');
% B=zeros(Tam(1),2);
% B(:,1)=A(:,Columnax);
% B(:,2)=A(:,Columnay);
% 
% time=B(:,1);
% V=B(:,2);
% Defl=V.*4500;
% 
% Fs=120000;
% N=length(Defl);
% xdft=fft(Defl);
% xdft=xdft(1:N/2+1);
% psdx=(1/(Fs*N))*abs(xdft).^2;
% psdx(2:end-1) = 2*psdx(2:end-1);
% freq=0:Fs/length(Defl):Fs/2;
% [Fre,O]=find(freq<40000 & freq>30000);
% Fr=freq(O);
% Pxxcut=psdx(O);
% plot(Fr,Pxxcut);
