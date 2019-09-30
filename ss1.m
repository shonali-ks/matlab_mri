rgb = imread('/home/student/Downloads/56.jpg'); 
                                                                             %Reading image
figure(1)
imshow(rgb)
gray = rgb2gray(rgb);  
figure(2)                                                                   %Converting to Gray Scale                             
imshow(gray);
kernel1 = -1 * ones(3)/9;
kernel1(2,2) = 8/9

i = imfilter(single(gray), kernel1);                                       %Applying High Pass Filter


med_fil = medfilt2(i);                                                     %Applying Median Filter to the gray scale image
                                                                           %Enhances the quality of the image
                                                                           
                                                                           %Applying gaussian filter to image for noise removal
                                                                           
I=imgaussfilt(rgb,1);
figure(3)
imshow(I)
