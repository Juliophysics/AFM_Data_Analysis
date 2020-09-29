clear all; close all; clc


PA6_800_data=[2.225 1.5343 1.3971 1.57 1.2958 0.9261];

PA610_data=[1.9966 0.8478 0.8631 1.1255 0.9589 0.7448];


PA66_data=[2.549 1.197 0.7482 0.7436 0.9339 0.5564];

PA6I_data=[3.4957 1.4622 1.4497 2.21 1.9735 1.523];


time=[0 2 6 12 120 672];

figure();

plot(time,PA6_800_data,'-ko');
hold on 
plot(time,PA610_data,'-bo');
hold on 
loglog(time,PA66_data,'-ro');
hold on 
plot(time,PA6I_data,'-go');
legend('PA6I')
xlim([-100,700])

legend('PA6_800um')
legend('PA610')






