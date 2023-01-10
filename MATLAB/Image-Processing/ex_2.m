clear
clf
f=imread('baboon.jpg');
figure(1),imshow(f)
g=im2double(f);
figure(2),imshow(g)
sc=0.5;
no=sc*rand(size(f,1),size(f,2));
R=g(:,:,1); %all row all column stack 1 (red)
G=g(:,:,2); %all row all column stack 2 (green)
B=g(:,:,3); %all row all column stack 3 (blue)
figure(2),subplot(221),imshow(g);title('Original');
figure(2),subplot(222),imshow(R);title('Red');
figure(2),subplot(223),imshow(G);title('Green');
figure(2),subplot(224),imshow(B);title('Blue');

nR=R+no; %add noise to red components
nG=G+no;
nB=B+no;
ng=cat(3,nR,nG,nB); %combine back to 3 stacks
ng=mat2gray(ng) %map value back to 0-1
figure(3),subplot(221),imshow(ng);title('Noise');
figure(3),subplot(222),imshow(nR);title('Noisy Red');
figure(3),subplot(223),imshow(nG);title('Noisy Green');
figure(3),subplot(224),imshow(nB);title('Noisy Blue');

nng=imnoise(f,'gaussian');
figure(4),imshow(nng);
imwrite(ng,'noisyBaboon.jpg');







