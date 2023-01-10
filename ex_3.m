clear
clf
f=imread('brain.jpg');
f=im2double(f(:,:,1));
figure(1),imshow(f)
imshow(f)
impixelinfo

nf=imnoise(f,'salt & pepper');
figure(2),imshow(nf),title('Salt & Pepper')
nnf=imnoise(f,'gaussian');
figure(3),imshow(nnf),title('Gaussian')

% Binarization or Thresholding
% grayscale to binary image
% set the threshold, check if original pixel value > threshold
% corresponding output pixel will be 1 and vice versa
thes=0.6;
for i=1:size(f,1)
    for j=1:size(f,2)
        if f(i,j)>thes
            g(i,j)=1;
        else
            g(i,j)=0;
        end
    end
end
figure(4),imshow(g)

%level slicing -> Binarization with two threshold values
thres1=0.5;
thres2=0.6;
for i=1:size(f,1)
    for j=1:size(f,2)
        if f(i,j)>thres1 && f(i,j)<thres2
            g3(i,j,1)=244/255;
            g3(i,j,2)=153/255;
            g3(i,j,3)=255/255;
        else
            g3(i,j,1)=f(i,j);
            g3(i,j,2)=f(i,j);
            g3(i,j,3)=f(i,j);
        end
    end
end
figure(5),imshow(g3)

%Negative  change to opposite

for i=1:size(f,1)
    for j=1:size(f,2)
        g5(i,j)=1-f(i,j);
    end
end
figure(6),imshow(g5)









