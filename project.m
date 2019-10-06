rgb = imread('th.jpg'); 
                                                                           %Reading image
figure(1)
imshow(rgb)
gray = rgb2gray(rgb);  
figure(2)                                                                  %Converting to Gray Scale                             
imshow(gray);
kernel1 = -1 * ones(3)/9;
kernel1(2,2) = 8/9;
%Applying gaussian filter to image for noise removal
gauss=imgaussfilt(gray,1);


%Enhances the quality of the image
SE = strel('diamond',6);
%eroding the image
I= imerode(gauss,SE);
figure(3)
imshow(I)
%dialating the image
se=strel('diamond',3);
J = imdilate(I,se);
figure(4)
imshow(J)
%using morphological open for background estimation
open = imopen(J,SE);
figure(5)
imshow(open)
%negating the image
neg = imcomplement(open);
figure(6)
imshow(neg)
%subtracting eroded image with negated image
img1=I-neg;
figure(7)
imshow(img1)
%subracting eroded image with background estimated one
img2=I-open;
figure(8)
imshow(img2)
%subracting two images
img3=img1-img2;
figure(9)
imshow(img3)
%threshodling and converting it into binary image
level = graythresh(img3);
BW = im2bw(img3,level);
%BW = im2bw(img3,level); (if matlab version is >=2016
figure(10)
imshow(BW)

