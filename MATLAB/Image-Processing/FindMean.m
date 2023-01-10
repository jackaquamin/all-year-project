function [xbar] = FindMean(f)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N = size(f,1)*size(f,2)
xbar = sum(sum(f))/N;
end

