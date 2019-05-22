%reading original image

image_rgb = rgb2gray(imread('img.jpg'));
[M N]=size(image_rgb);

%converting RGB image into gray scale image 
original_image=zeros(M,N,'double');
for M = 1:M
    for N = 1:N
        original_image(M,N)=image_rgb(M,N);
    end
end 

figure,imshow(mat2gray(image_rgb));
title('ORIGINAL IMAGE');

%creating empty image to apply HE
[M N]=size(original_image);
new_image=zeros(M,N,'double');

total_pixel=M*N;

%HISTOGRAM EQUALIZATION ALGORITHM IMPLIMENTATION

%STEP 01 :Frequency TABL

frequency=zeros(256,1);
for M = 1:M
    for N = 1:N
        pixel_value=original_image(M,N);  
        frequency(pixel_value+1)=frequency(pixel_value+1)+1;
    end
end

%STEP 02:PDF Calculation

pdf=zeros(256,1);
for p = 1:256
    pdf(p)=frequency(p)/total_pixel;
end    

%step 03:CDF Calculation

cdf=zeros(256,1);
sum=0;
for p = 1:256
    sum=sum+pdf(p);
    cdf(p)=sum;
end

roundoff=zeros(256,1);
for p =1:256
    roundoff(p)= round(cdf(p)*255);
end

for M = 1:M
    for N = 1:N
        new_image(M,N)= roundoff(original_image(M,N)+1);
    end
end 

figure,imshow(mat2gray(new_image));
title('HE APPLIED IMAGE');






 

