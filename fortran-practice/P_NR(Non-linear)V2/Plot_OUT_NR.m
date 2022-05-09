clc; clear all; close all;

OUT_NR;

a= result;

figure (1)
plot(a(:,4))
xlabel('횟수')
ylabel('오차(기하평균)')
title('오차')

figure (2)
plot3(a(:,4),a(:,5),a(:,1))
xlabel('F1')
ylabel('F2')
zlabel('iteration')
title('함수 결과값 추적')

figure (3)
plot3(a(:,2),a(:,3),a(:,1))
xlabel('X1')
ylabel('X2')
zlabel('iteration')
title('변수 결과값 추적')