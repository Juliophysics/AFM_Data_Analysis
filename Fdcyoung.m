clear all;close all;clc

k_spring=40; 
%...............Reading all Images.....................%

Img=imread('Image.png');
Topography=imread('Topography.png');
scanTB=imread('scan_TB.png');

%.................Calibration data.................................

Filename_cal_zpiezo=sprintf('Acero_Topography.txt');
Data_cal_zpiezo=load(Filename_cal_zpiezo);
Data_cal_zpiezo=Data_cal_zpiezo(1:500,2);

Filename_cal_voltage=sprintf('Acero_T-B.txt');
Data_cal_voltage=load(Filename_cal_voltage);
Data_cal_voltage=Data_cal_voltage(1:500,2);
%rearranging...............

MAX_Calib=max(Data_cal_zpiezo(:));
Data_cal_zpiezo=Data_cal_zpiezo(:)-MAX_Calib;
Data_cal_zpiezo=-Data_cal_zpiezo;

%....................................................
Vsmooth_cal=Data_cal_voltage(1:3*length(Data_cal_voltage)/4);
zpiezosmooth_cal=Data_cal_zpiezo(1:3*length(Data_cal_zpiezo)/4);
Vsmooth_cal=Vsmooth_cal(3:3:end);
zpiezosmooth_cal=zpiezosmooth_cal(3:3:end);
sgf_cal = sgolayfilt(Vsmooth_cal,3,11);
Vsgf_cal=sgolayfilt(zpiezosmooth_cal,1,11);


dydx_cal=diff(sgf_cal(:))./diff(Vsgf_cal(:));
% figure();
% plot(Vsgf_cal,sgf_cal,'.');
% title('smoothed data calibration')
% figure();
% plot(Vsgf_cal(1:end-1),dydx_cal);
% title('Derivative')




sgfdydx_cal=sgolayfilt(dydx_cal,3,11);
% figure();
% plot(Vsgf_cal(1:end-1),sgfdydx_cal,'.');
% title('smoothed derivative')

dydx2_cal=diff(sgfdydx_cal(:))./diff(Vsgf_cal(1:end-1));
% figure();
% plot(Vsgf_cal(3:end),dydx2_cal);
% title('Second derivative');

sgfdydx2_cal=sgolayfilt(dydx2_cal,3,11);
figure();
plot(Vsgf_cal(1:end-2),sgfdydx2_cal,'.');
title('smoothed second derivative')
[Contactpoint_cal,P_cal]=max(sgfdydx2_cal(1:end-3));

Contact_in_cal=Data_cal_zpiezo(P_cal*3);
Vref_cal=Data_cal_voltage(P_cal*3);


ArrayE=zeros(1,25);

.....................................................................
for K=1:25

Filename_Data_zpiezo=sprintf('FDC_%03d_Topography.txt',K);
Data_zpiezo=load(Filename_Data_zpiezo);
Data_zpiezo=Data_zpiezo(1:500,2);

Filename_Data_voltage=sprintf('FDC_%03d_T-B.txt',K);
Data_voltage=load(Filename_Data_voltage);
Data_voltage=Data_voltage(1:500,2);

%..............Rearranging Data.................................%

MAX_Data=max(Data_zpiezo(:));
Data_zpiezo=Data_zpiezo(:)-MAX_Data;
Data_zpiezo=-Data_zpiezo;


% 
% plot(Data_zpiezo,Data_voltage)
%...................................................................


%.................Smoothing curve to find contact point.................


Vsmooth=Data_voltage(1:3*length(Data_voltage)/4);
zpiezosmooth=Data_zpiezo(1:3*length(Data_zpiezo)/4);
Vsmooth=Vsmooth(3:3:end);
zpiezosmooth=zpiezosmooth(3:3:end);
sgf = sgolayfilt(Vsmooth,3,11);
Vsgf=sgolayfilt(zpiezosmooth,1,11);


dydx=diff(sgf(:))./diff(Vsgf(:));
% figure();
% plot(Vsgf,sgf,'.');
% title('smoothed data')
% figure();
% plot(Vsgf(1:end-1),dydx);
% title('Derivative')

sgfdydx=sgolayfilt(dydx,3,11);
% figure();
% plot(Vsgf(1:end-1),sgfdydx,'.');
% title('smoothed derivative')

dydx2=diff(sgfdydx(:))./diff(Vsgf(1:end-1));
% figure();
% plot(Vsgf(3:end),dydx2);
% title('Second derivative');

sgfdydx2=sgolayfilt(dydx2,3,11);
% figure();
% plot(Vsgf(1:end-2),sgfdydx2,'.');
% title('smoothed second derivative')
[Contactpoint,P]=max(sgfdydx2(1:end-3));

Contact_in=Data_zpiezo(P*3);
Vref=Data_voltage(P*3);

%.................cut data from contact point..........................

V_cut=Data_voltage(P*3:end);
Cut_zpiezo_measurements=Data_zpiezo(P*3:end);

Voltage_acero_cut=Data_cal_voltage(P_cal*3:end);
Cut_zpiezo_Cal=Data_cal_zpiezo(P_cal*3:end);
...................................................................
    
%Making a fit to calibration slope ,comparing cal with measurements FDC's 

p1 = polyfit(Cut_zpiezo_measurements,V_cut,1);

p2 = polyfit(Cut_zpiezo_Cal,Voltage_acero_cut,1);
  
% figure();
% plot(Cut_zpiezo_measurements,V_cut);
% hold on
% plot(Cut_zpiezo_Cal,Voltage_acero_cut );

%.............Rearranging.........................................
minimo_zpiezo=min(Cut_zpiezo_measurements);
minimo_Vsample=min(V_cut);

Cut_zpiezo_measurements=Cut_zpiezo_measurements-minimo_zpiezo;
V_cut=V_cut-minimo_Vsample;


..................................................................
    
fit_cal=p2(1).*Cut_zpiezo_measurements;
% figure();
% plot(Cut_zpiezo_measurements,V_cut);
% hold on
% plot(Cut_zpiezo_measurements,fit_cal);

%.....................Deflection per volt (nm/V)..........................

Def_pvolt_cal=1/p2(1); %Calibration

z_sam=1/p1(1);
ind=z_sam-Def_pvolt_cal;

%................deflection and indentation.....................

 Deflection_sample=V_cut.*Def_pvolt_cal;
 Deflection_calibration=fit_cal.*Def_pvolt_cal;
%  figure();
%  plot(Cut_zpiezo_measurements,Deflection_sample);
%  hold on
%  plot(Cut_zpiezo_measurements,Deflection_calibration );
 
 Indentation = Deflection_calibration-Deflection_sample;
 Force=Deflection_sample*k_spring;
%  figure();
%  plot(Indentation,Force);

 
%  Indentation_233_pos=find(Indentation>232);
%  Indentation_233=Indentation(Indentation_233_pos);
%  new_min_Ind=min(Indentation_233);
%  
%  Indentation_233=Indentation_233-new_min_Ind;
%  Force_an=Force(Indentation_233_pos);
%  new_min_Force=min(Force_an);
%  Force_an=Force_an-new_min_Force;

 

%fun=@(E)(2*E/(1-0.39^2)).*(a.*Indentation_233-(m*(a.^2)/tand(18)).*(pi/2 - asin(b./a))-(a.^3)/(3*R) + (((a.^2)-b^2).^(0.5)).*(m*b/tand(18) + ((a.^2)-b^2)/(3*R)))-Force_an

%F_model_Hertz=(0.7453*E*tand(18))/(1-0.39^2).*Indentation.^2;

% b=75;
% R=100;
% n=(2^(3/2))/pi;
% m=pi*2^(0.5);
% a=zeros(numel(Indentation_233),1);

% for i=1:numel(Indentation_233)
% Func=@(a)Indentation_233(i)-(a/R)*((a^2 -b^2)^(0.5) - a)-n*a/tand(18)*(pi/2 - asin(b/a));
% a0=80;
% a(i)=fsolve(Func,a0);        The usage of this model in basis tobook
% end



fun=@(E)(E(2)+((2/pi)*E(1)*tand(18))/(1-0.39^2).*Indentation(end/2:end).^2)-Force(end/2:end);
X0=[0.1,0];
E=lsqnonlin(fun,X0);
E(1)
ArrayE(K)=E(1);
Fmodel_Hertz=(((2/pi)*E(1)*tand(18))/(1-0.39^2).*(Indentation.^2))+E(2);
 figure();
 plot(Indentation,Force);
 hold on
 plot(Indentation,Fmodel_Hertz);

end

E_mean=sum(ArrayE)/numel(ArrayE);