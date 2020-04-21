clear all; 
clc;
aa = imread('image.jpg');
a = double(aa);
[row col]=size(a);
w1= [1 0; 0 -1];
w2= [0 1; -1,0];
for x = 2:1:row-1;
  for y=2:1:col-1;
    a1(x,y)=w1(1)*a(x,y)+w1(2)*a(x,y+1)+w1(3)*a(x+1,y)+w1(4)*a(x+1,y+1);
    a2(x,y)=w2(1)*a(x,y)+w2(2)*a(x,y+1)+w2(3)*a(x+1,y)+w2(4)*a(x+1,y+1);
    end
end
a3 = a1+a2; 
figure(1)
imshow(uint8(a1)) %% The x-gradient image
figure(2)
imshow(uint8(a2)) %%the -gradient image 
figure(3)
imshow(uint8(a3)) %%Final image
    