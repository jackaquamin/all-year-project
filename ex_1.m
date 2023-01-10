clear
clf
e=randn(1,100); % define random vector
figure(1), plot(e);
grid on; title('My first plot');xlabel('Time');ylabel('Amplitude')
e2=rand(1,100);
figure(2), plot(e2);
grid on; title('My second plot');xlabel('Time');ylabel('Amplitude')
figure(3), subplot(2,2,1), plot(e2)
grid on; title('Uniform Distributed Noise');xlabel('Time');ylabel('Amplitude')
figure(3), subplot(2,2,4), plot(e)
grid on; title('Gaussian Distributed Noise');xlabel('Time');ylabel('Amplitude')
n=[1:100]; %create vector
figure(4),plot(n,e,'r',n,e2,'b',n,e,'+m',n,e2,'*y') %create 4 graph in same
window,color
grid on; title('RED: randn green: rand');xlabel('Time');ylabel('Amplitude')
axis([0 100 -3 3])
% A*cos(2*pi*f*n + ph) f = frequency
% cos(2*pi*n/T) T = period
nn = [0:0.1:10]
T = 2;A = 10;ph = 0;
% y = A*cos(2*pi*nn/T + ph) %generate cos signal using T=
y=genSine(20,4,pi/6,0,10,0.1);
e3=randn(1,size(y,2));
figure(5),subplot(3,1,1),plot([1:101],e3,'b')
grid on; title('Noise');xlabel('Time');ylabel('Amplitude')
figure(5),subplot(312),plot(nn,y,'g')
grid on; title('My sine');xlabel('Time');ylabel('Amplitude')
axis([0 10 -25 25])
ny=y+1.5*e3;
figure(5),subplot(313),plot(nn,ny,'r')
grid on; title('My Noisy sine');xlabel('Time');ylabel('Amplitude')
save mysig.txt y -ascii
yy=load ('mysig.txt');
ecg=load('ecg.txt');
nnn=[1:size(ecg,1)]; nnn=nnn';
e4=0.4*randn(size(ecg,1),size(ecg,2));
figure(6),plot(nnn,ecg,'b',nnn,e4-2,'r',nnn,ecg+e4+2,'g');grid on; title('My ECG: Blue-Clean ECG, Red-Noise, Green-Noisy
ECG');xlabel('Time');ylabel('Amplitude')