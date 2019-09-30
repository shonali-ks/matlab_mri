rgb = imread('/home/student/Downloads/56.jpg'); 
                                                                           %Reading image
figure(1)
imshow(rgb)
gray = rgb2gray(rgb);  
figure(2)                                                                  %Converting to Gray Scale                             
imshow(gray);
kernel1 = -1 * ones(3)/9;
kernel1(2,2) = 8/9;
gauss=imgaussfilt(gray,1);


%Enhances the quality of the image
                                                                           
                                                                           %Applying gaussian filter to image for noise removal
SE = strel('diamond',6);                                                                          
I= imerode(gauss,SE);
figure(3)
imshow(I)
se=strel('diamond',3);
J = imdilate(I,se);
figure(4)
imshow(J)
open = imopen(J,SE);
figure(5)
imshow(open)
