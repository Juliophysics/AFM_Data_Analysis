clear all; close all; clc;

mkdir 'Data_to_xmgrace'
path='C:\Users\Julio\Desktop\Final_data_Julio\Young_hoyitos\4_allsamples\Data_to_xmgrace';

Filename_Data_zpiezo=sprintf('Acero_Topography.txt');
Data_zpiezo=load(Filename_Data_zpiezo);
Data_zpiezo=Data_zpiezo(1:1000,2);

Filename_Data_voltage=sprintf('Acero_T-B.txt');
Data_voltage=load(Filename_Data_voltage);
Data_voltage=Data_voltage(1:1000,2).*1600;

MAX_Data=max(Data_zpiezo(:));
Data_zpiezo=Data_zpiezo(:)-MAX_Data;
Data_zpiezo=-Data_zpiezo;

File=zeros(length(Data_zpiezo),2);
File(:,1)=Data_zpiezo;
File(:,2)=Data_voltage;

filename = [Filename_Data_voltage] ;   % text file name 

file = [path filesep filename] ;  % make filename  with path 
   

save(file,'File','-ascii','-double')

plot(Data_zpiezo,Data_voltage,'c');
hold on
for K=7:10

    
Filename_Data_zpiezo=sprintf('FDC_%03d_Topography_PA6,6.txt',K);
Data_zpiezo=load(Filename_Data_zpiezo);
Data_zpiezo=Data_zpiezo(1:1000,2);

Filename_Data_voltage=sprintf('FDC_%03d_T-B_PA6,6.txt',K);
Data_voltage=load(Filename_Data_voltage);
Data_voltage=Data_voltage(1:1000,2).*1600;

MAX_Data=max(Data_zpiezo(:));
Data_zpiezo=Data_zpiezo(:)-MAX_Data;
Data_zpiezo=-Data_zpiezo;

File=zeros(length(Data_zpiezo),2);
File(:,1)=Data_zpiezo;
File(:,2)=Data_voltage;

filename = [Filename_Data_voltage] ;   % text file name 

file = [path filesep filename] ;  % make filename  with path 
   

save(file,'File','-ascii','-double')

plot(Data_zpiezo,Data_voltage,'r');
hold on







end

for K=7:10
    
Filename_Data_zpiezo=sprintf('FDC_%03d_Topography_PA6,10.txt',K);
Data_zpiezo=load(Filename_Data_zpiezo);
Data_zpiezo=Data_zpiezo(1:1000,2);

Filename_Data_voltage=sprintf('FDC_%03d_T-B_PA6,10.txt',K);
Data_voltage=load(Filename_Data_voltage);
Data_voltage=Data_voltage(1:1000,2).*1600;

MAX_Data=max(Data_zpiezo(:));
Data_zpiezo=Data_zpiezo(:)-MAX_Data;
Data_zpiezo=-Data_zpiezo;

File=zeros(length(Data_zpiezo),2);
File(:,1)=Data_zpiezo;
File(:,2)=Data_voltage;

filename = [Filename_Data_voltage] ;   % text file name 

file = [path filesep filename] ;  % make filename  with path 
   

save(file,'File','-ascii','-double')

plot(Data_zpiezo,Data_voltage,'b');
hold on


end
for K=7:10
    
Filename_Data_zpiezo=sprintf('FDC_%03d_Topography_PA6_crystal.txt',K);
Data_zpiezo=load(Filename_Data_zpiezo);
Data_zpiezo=Data_zpiezo(1:1000,2);

Filename_Data_voltage=sprintf('FDC_%03d_T-B_PA6_crystal.txt',K);
Data_voltage=load(Filename_Data_voltage);
Data_voltage=Data_voltage(1:1000,2).*1600;

MAX_Data=max(Data_zpiezo(:));
Data_zpiezo=Data_zpiezo(:)-MAX_Data;
Data_zpiezo=-Data_zpiezo;

File=zeros(length(Data_zpiezo),2);
File(:,1)=Data_zpiezo;
File(:,2)=Data_voltage;

filename = [Filename_Data_voltage] ;   % text file name 

file = [path filesep filename] ;  % make filename  with path 
   

save(file,'File','-ascii','-double')

plot(Data_zpiezo,Data_voltage,'g');
hold on


end
for K=7:10
    
Filename_Data_zpiezo=sprintf('FDC_%03d_Topography_PA6_50.txt',K);
Data_zpiezo=load(Filename_Data_zpiezo);
Data_zpiezo=Data_zpiezo(1:1000,2);

Filename_Data_voltage=sprintf('FDC_%03d_T-B_PA6_50.txt',K);
Data_voltage=load(Filename_Data_voltage);
Data_voltage=Data_voltage(1:1000,2).*1600;

MAX_Data=max(Data_zpiezo(:));
Data_zpiezo=Data_zpiezo(:)-MAX_Data;
Data_zpiezo=-Data_zpiezo;

File=zeros(length(Data_zpiezo),2);
File(:,1)=Data_zpiezo;
File(:,2)=Data_voltage;

filename = [Filename_Data_voltage] ;   % text file name 

file = [path filesep filename] ;  % make filename  with path 
   

save(file,'File','-ascii','-double')

plot(Data_zpiezo,Data_voltage,'m');
hold on


end
for K=7:10
    
Filename_Data_zpiezo=sprintf('FDC_%03d_Topography_PA6I.txt',K);
Data_zpiezo=load(Filename_Data_zpiezo);
Data_zpiezo=Data_zpiezo(1:1000,2);

Filename_Data_voltage=sprintf('FDC_%03d_T-B_PA6I.txt',K);
Data_voltage=load(Filename_Data_voltage);
Data_voltage=Data_voltage(1:1000,2).*1600;

MAX_Data=max(Data_zpiezo(:));
Data_zpiezo=Data_zpiezo(:)-MAX_Data;
Data_zpiezo=-Data_zpiezo;

File=zeros(length(Data_zpiezo),2);
File(:,1)=Data_zpiezo;
File(:,2)=Data_voltage;

filename = [Filename_Data_voltage] ;   % text file name 

file = [path filesep filename] ;  % make filename  with path 
   

save(file,'File','-ascii','-double')

plot(Data_zpiezo,Data_voltage,'k');
hold on


end
  

