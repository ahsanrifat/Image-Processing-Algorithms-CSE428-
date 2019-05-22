%Taking Input Image
img=imread('img.jpg');
figure,imshow(img);

I=zeros(size(img));

%making box filter
b=input('Enter Averaging Mask size: ');
box=zeros(b,b,'double');
for M = 1:b
    for N = 1:b
        box(M,N)=1/b;
    end
end 

img=padarray(img,[1,1]);
img=double(img);

for i=1:size(img,1)-2
	for j=1:size(img,2)-2
    	
    	I(i,j)=sum(sum(F1.*img(i:i+2,j:j+2)));
    	
	end
end

I=uint8(I);
figure,imshow(I);title('Filtered Image');

