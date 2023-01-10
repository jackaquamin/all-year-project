function [stdVal, varianceVal] = FindSTD(f)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
xbar = FindMean(f);
N = size(f,1)*size(f,2);
sum = 0;
for i = 1:size(f,1)
    for j = 1:size(f,2)
        sum = sum + (f(i,j)-xbar)^2;
    end
end
varianceVal = sum/(N-1);
stdVal = sqrt(varianceVal);