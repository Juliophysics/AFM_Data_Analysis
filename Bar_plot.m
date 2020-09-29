clear all; close all; clc;
somenames={'PA6,10'; 'PA6I'; };
y = [0.3219 0.3038 0.4293; 0.7067 0.3681 1.7767];
b = bar(y,'FaceColor','flat');
set(gca,'xticklabel',somenames)
hold on 

h = zeros(3,1);
h(1)=plot(NaN,NaN,'-b');
h(2)=plot(NaN,NaN,'-c');
h(3)=plot(NaN,NaN,'-y');

legend(h, '0hrs', '20hrs','6days');


