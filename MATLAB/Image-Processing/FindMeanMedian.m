function [xbar,xmed] = FindMeanMedian(f)

%   This function is to comput mean and median of input vector
%   or matrix f
%   example
%   a = rand(1,100);
%   [xbar,xmed] = FindMeanMedian(a);

N = size(f,1)*size(f,2)
xbar = sum(sum(f))/N;
xmed = median(median(f));
end
