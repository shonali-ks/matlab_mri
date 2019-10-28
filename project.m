 %Reading image
 rgb = imread('th.jpg'); 
                                                                           
figure(1)
imshow(rgb)

%Converting to Gray Scale 

gray = rgb2gray(rgb);  
figure(2)                                                                                              
imshow(gray);
kernel1 = -1 * ones(3)/9;
kernel1(2,2) = 8/9;


%Applying gaussian filter to image for noise removal

gauss=imgaussfilt(gray,1);


%Enhances the quality of the image
%eroding the image

SE = strel('diamond',10);
I= imerode(gauss,SE);
figure(3)
imshow(I)

%dialating the image

se=strel('diamond',5);
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

%boundary outline
B = bwmorph(BW,'remove');
figure(11)
imshow(B)

%contouring greyscaled image
figure(12)
imcontour(gray)

%contouring tumour
figure(13)
imcontour(img3)

%c-label of tumour
figure(14)
C = contour(img3);
clabel(C)

%contourf for tumour
figure (15)
contourf(img3)
