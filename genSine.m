function [y] = genSine(A,T,ph,minN,maxN,stepN)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n=[minN:stepN:maxN];
y = A*cos(2*pi*n/T + ph)
end

