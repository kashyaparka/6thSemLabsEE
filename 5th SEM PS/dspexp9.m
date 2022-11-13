%Rexp9
%Program : (MATLAB) Conversion of colour image to gray image
clc;
close all;
clear all;
RGB = imread('peppers.png');
imshow(RGB) I = rgb2gray(RGB);
figure imshow(I)

%Program : (MATLAB) Image enhancement
close all
clear all
clc
%%%%%%%%%%%%%%%%%
pout = imread("D:\pout.jfif");
pout_imadjust = imadjust(pout);
pout_histeq = histeq(pout);
pout_adapthisteq = adapthisteq(pout);
montage({pout,pout_imadjust,pout_histeq,pout_adapthisteq},"Size",[1 4])
title("Original Image and Enhanced Images using imadjust, histeq, and adapthisteq")


%Program : (MATLAB) Image Edge Detection
%%%%% Program for Edge Detection
close all;
Clear all;
clc;
I = imread('trees.jpeg');
imshow(I)
I1=rgb2gray(I);
BW1 = edge(I1,'sobel');
BW2 = edge(I1,'canny');
BW3= edge(I1,'Prewitt');
tiledlayout(1,3)
nexttile
imshow(BW1)
title('Sobel Filter')
nexttile
imshow(BW2)
title('Canny Filter')
nexttile
imshow(BW3)
title('Pretwitt Filter')
%%% End

%Assign1:Find the histogram of an image.Enhance the image using histogram equalization

I=imread('trees.png');
figure
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imhist(I,64);
title('Histogram of image')

 J=histeq(I);
 figure
 subplot(1,2,1)
 imshow(J)
 subplot(1,2,2);
 imhist(J,64)
 title('Histogram equalisation of image')





















