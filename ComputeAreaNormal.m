function [area] = ComputeAreaNormal(x1,x2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x=[-8:0.01:8];
xbar = 0;
sd = 1;
f1 = 1/(sd*sqrt(2*pi))*exp(-(x-xbar).^2/(2*sd^2));

delta = x(2)-x(1);
ocmf1 = f1(1)*delta;
for i = 2:size(f1,2)
    if (x(i)<=x1)
    cmf4 = ocmf1+f1(i)*delta;
    ocmf1 = cmf4;
    end
end

delta = x(2)-x(1);
ocmf2 = f1(1)*delta;
for i = 2:size(f1,2)
    if (x(i)<=x2)
    cmf5 = ocmf2+f1(i)*delta;
    ocmf2 = cmf5;
    end
end

area = cmf5-cmf4;
end

