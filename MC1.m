clc
clear
close all

a = 0;
b = 2*pi;
pos_h = 1.5;
neg_h = -1.5;
n = 100000;

r = rand(n,2);
r(:,1) = r(:,1)*(b-a)+a;
r(:,2) = r(:,2)*(pos_h-neg_h)+neg_h;

g_x = g(r(:,1));

under_g_condition = (r(:,2) > 0) & (r(:,2) < g_x);
upper_g_condition = (r(:,2) < 0) & (r(:,2) > g_x);

number_of_y_under_g = sum(under_g_condition);
number_of_y_upper_g = sum(upper_g_condition);

p_of_y_under_g = number_of_y_under_g / n;
p_of_y_upper_g = number_of_y_upper_g / n;

S_pos = (pos_h)*(b-a)*p_of_y_under_g;
S_neg = (neg_h)*(b-a)*p_of_y_upper_g;
S = S_pos + S_neg;
disp(S);

red_points1 = r.*under_g_condition;
red_points2 = r.*upper_g_condition;

figure(1);
hold on;
plot(r(:,1),r(:,2),'.b');
plot(red_points1(:,1),red_points1(:,2),'.r');
plot(red_points2(:,1),red_points2(:,2),'.r');
hold off;


function [Y] = g(X)
%Y =  X;
Y = sin(X);
end
