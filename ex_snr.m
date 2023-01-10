clear
clf
n = rand(1,200);
t = [0:0.1:19.9];
s = 0.5*sin(2*pi.*t/2);
sn = n+s;
figure(1),plot(sn)
an = max(n)-min(n) %amplitude of noise
sn = max(s)-min(s) %signal of noise
snr = 20*log(sn/an)
sc = [1.5 1 0.8 0.6 0.4 0.2 0.1 0.0001] %scale vector 8 cases
snr = zeros(1,8);

for i = 1:8
n = sc(i)*rand(1,200);
sn = n+s;
an = max(n)-min(n)
sn2 = max(s)-min(s)
snr(i) = 20*log(sn2/an)
b00 = sprintf("SNR:%3.2f dB",snr(i));
figure(1),subplot(2,4,i),plot(t,sn),title(b00)
end

snr 

ss = 1;
nn = [1 0.1 0.01 0.001]
for i =1:4
snr2(i) = 20*log(ss/nn(i))
end