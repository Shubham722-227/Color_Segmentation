% MATLAB code for using custom and automatic threshold for segmentation
% read the image.
k=imread("image.jpg");

%Convert into double format.
k=double(k);

% take the average of R, G and B channels.
k1=(k(:,:,1)+k(:,:,2)+k(:,:,3))/3;

% display after converting into uint8 format.
%imtool(uint8(k1),[]);

% read in tiff image and convert it to double format
my_image = k1;
my_image = my_image(:,:,1);

% perform thresholding by logical indexing( Trial and error)
image_thresholded = my_image;
image_thresholded(my_image>3) = 256;
image_thresholded(my_image<0.5) = 0;

% display result
figure()
subplot(1,2,1)
imshow(my_image,[])
title('original image')
subplot(1,2,2)
imshow(image_thresholded,[])
title('thresholded image')

%Calculate a 16-bin histogram for the image.
[counts,x] = imhist(k,16);
stem(x,counts)

%Compute a global threshold using the histogram counts.
T = otsuthresh(counts);

%Create a binary image using the computed threshold and display the image.
BW = imbinarize(k1,T);
imshow(BW)
title('thresholded image 2')

A=imread('image.jpg');
B = rgb2hsv(A);

%converting the image to HSV space
imhist(A(:,:,1))
figure
imshow(B(:,:,1));
title('Hue image 1')

A= hsv2rgb(B);
figure
imshow(A(:,:,1));
title('Hue image 2')
