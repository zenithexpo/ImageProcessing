clc;
clear all;
close all;
colorimg = imread("image.jpg");
[height width channels] = size(colorimg);
if channels ==3
    f = rgb2gray(colorimg);
else
    f=colorimg
    %msgbox("Image is already in grayscale");
end
%%Step 1: Plot histogram of input(original) image
nk = zeros(1,256);
for x = 1: height
    for y = 1: width
        r = f(x,y)+1;
        nk(r) = nk(r)+1;
    end
end
figure,imshow(f);title("Original Image");
figure, bar(nk);title("Histogram of Original Image");
%%Step 2: Plot normalized histogram of input(original) image
totalsize = height*width;
pr_rk = nk/totalsize;
figure, bar(pr_rk);title("Normalized Histogram of Original Image");
%%Step 3: Compute the histogram transformation function and plot it
sk  = zeros(1,256);
sk(1) = 255*pr_rk(1);
for k = 2 : 256
    sk(k) = sk(k-1)+255*pr_rk(k);
end
figure, bar(sk);title("Histogram Transformation function");
sk = round(sk);
%%Step 4: Perform mapping of processed (Histogram Equalized) image
for x = 1: height
    for y = 1: width
        r = f(x,y)+1;
        g(x,y) = sk(r);
    end
end
figure, imshow(g,[]);title("Histogram equalized image");
%%Step 5: Plot hisogram of processed (hisogram equalized) image
nk_he = zeros(1,256);
for x = 1: height
    for y = 1: width
        r = g(x,y)+1;
        nk_he(r) = nk_he(r)+1;
    end
end
figure;bar(nk_he);title("Histogram of Hist Eq. Image");

figure,
subplot(2,2,1); imshow(f); title("Original image");
subplot(2,2,2); bar(nk); title("Histogram of original image");
subplot(2,2,3); imshow(g,[]); title("Histogram Equalized image(processed image)");
subplot(2,2,4); bar(nk_he); title("Histogram of original image");
