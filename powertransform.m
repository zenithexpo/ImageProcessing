clear all
clc
img1 = imread('image.jpg');
[row col] = size(img1);
gamma = input('Enter the correction factor: ');
img = double(img1);
for i = 1:row
  for j = 1:col 
  nuimg(i,j) = img(i,j)^gamma;
endfor 
endfor 

numax = max(max(nuimg)) ;
numin = min(min(nuimg));
n = 255/(numax - numin);
for i = 1:row 
  for j=1:col 
    nuimg(i,j) = n*(nuimg(i,j)-numin)
    endfor
 endfor
numimg2 =uint8(nuimg1);
subplot(1,2,1)
imshow(img1);
title('Original Image');
subplot(1,2,2)
imshow(nuimg2);
title('Image post transformation');