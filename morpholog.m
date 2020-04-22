clear all 
clc 
a = imread('image.jpg')
p=size(a);

w = [1 1 1; 1 1 1; 1 1 1];
for x=2:1:p(1)-1
  for y=2:1:p(2)-1 
    a1=[w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1)
    w(4]