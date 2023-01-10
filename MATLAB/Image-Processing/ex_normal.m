clear 
clf
x=[-8:0.1:8];
xbar = 0;

sd = 1;
f1 = 1/(sd*sqrt(2*pi))*exp(-(x-xbar).^2/(2*sd^2));

sd = 2;
f2 = 1/(sd*sqrt(2*pi))*exp(-(x-xbar).^2/(2*sd^2));

sd = 3;
f3 = 1/(sd*sqrt(2*pi))*exp(-(x-xbar).^2/(2*sd^2));


figure(1),plot(x,f1,'r',x,f2,'g',x,f3,'b'), grid on, title('PDF of Normal Distribution')

% compute cdf
delta = x(2)-x(1);
cmf(1) = f1(1)*delta;
for i = 2:size(f1,2)
    cmf(i) = cmf(i-1)+f1(i)*delta
end

cmf2(2) = f2(1)*delta;
for i = 2:size(f2,2)
    cmf2(i) = cmf2(i-1)+f2(i)*delta
end

cmf3(3) = f3(1)*delta;
for i = 2:size(f3,2)
    cmf3(i) = cmf3(i-1)+f3(i)*delta
end
figure(2), plot(x,cmf,'r',x,cmf2,'g',x,cmf3,'b'), grid on, title('CMF of Normal Distribution')


sd1 = -1;
sd2 = 1;
delta = x(2)-x(1);
ocmf1 = f1(1)*delta;
for i = 2:size(f1,2)
    if (x(i)<=sd1)
    cmf4 = ocmf1+f1(i)*delta
    ocmf1 = cmf4;
    end
end

delta = x(2)-x(1);
ocmf2 = f1(1)*delta;
for i = 2:size(f1,2)
    if (x(i)<=sd2)
    cmf5 = ocmf2+f1(i)*delta
    ocmf2 = cmf5;
    end
end

cmf6 = cmf5-cmf4;