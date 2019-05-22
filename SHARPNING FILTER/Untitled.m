%Input Image
img=imread('img.jpg');
figure,imshow(img);

%Preallocate the matrices with zeros
I1=img;
I=zeros(size(img));

%Filter Masks
F1=[0 1 0;1 -4 1; 0 1 0];
F2=[1 1 1;1 -8 1; 1 1 1];

%Padarray with zeros
img=padarray(img,[1,1]);
img=double(img);

%Implementation of the equation in Fig.D
for i=1:size(img,1)-2
	for j=1:size(img,2)-2
    	
    	I(i,j)=sum(sum(F1.*img(i:i+2,j:j+2)));
    	
	end
end

I=uint8(I);
figure,imshow(I);title('Filtered Image');

%Sharpenend Image
%Refer Equation in Fig.F
B=I1-I;
figure,imshow(B);title('Sharpened Image');