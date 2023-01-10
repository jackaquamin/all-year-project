clear
clf
f=imread('brain.jpg');
f=im2double(f(:,:,1));
figure(1),imshow(f),title('Original')
impixelinfo

nf=imnoise(f,'salt & pepper');
figure(2),imshow(nf),title('Salt & Pepper')
nnf=imnoise(f,'gaussian');
figure(3),imshow(nnf),title('Gaussian')

%Averaging filter
h=(1/9)*ones(3,3)
for i=1:size(f,1)-2
    for j=1:size(f,2)-2
        w=nnf(i:i+2,j:j+2); % i,j=1  f(1:3,1:3)
        g(i,j)=sum(sum(w.*h)); % average filter
    end
end
g=mat2gray(g); % make sure that pixel value is not more than 1
figure(4),imshow(g),title('Averaging')

% Median filter
for i=1:size(f,1)-2
    for j=1:size(f,2)-2
        w=nf(i:i+2,j:j+2); % i,j=1  f(1:3,1:3)
        g2(i,j)=median(median(w)); % median filter
    end
end
g2=mat2gray(g2); % make sure that pixel value is not more than 1
figure(5),imshow(g2),title('Median');

% Edge filter
hx=ones(3,3); hx(2,:)=0; hx(3,:)=-1
hy=hx';
for i=1:size(f,1)-2
    for j=1:size(f,2)-2
        w=f(i:i+2,j:j+2); % i,j=1  f(1:3,1:3)
        gx(i,j)=abs(sum(sum(w.*hx))); % horizontal filter
    end
end
gx=mat2gray(gx); % make sure that pixel value is not more than 1
figure(5),imshow(gx),title('Horizontal Edge')

for i=1:size(f,1)-2
    for j=1:size(f,2)-2
        w=f(i:i+2,j:j+2); % i,j=1  f(1:3,1:3)
        gy(i,j)=abs(sum(sum(w.*hy))); % vertical filter
    end
end
gy=mat2gray(gy); % make sure that pixel value is not more than 1
figure(6),imshow(gy),title('Vertical Edge')

gxy=gx+gy;
gxy=mat2gray(gxy); % make sure that pixel value is not more than 1
figure(7),imshow(gxy),title('Edge')

gx=conv2(f,hx);
gy=conv2(f,hy);
gxy=abs(gx)+abs(gy);
gxy=mat2gray(gxy); % make sure that pixel value is not more than 1
figure(7),imshow(gxy),title('Edge')






