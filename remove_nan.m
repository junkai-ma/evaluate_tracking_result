function [ output ] = remove_nan( input )
%REMOVE_NAN Summary of this function goes here
%   Detailed explanation goes here
index = find(isnan(input(:,1)));

if isempty(index)
    output = input;
    return
else
    for i = length(index):1
        input(index(i),:) = [];
    end
    output = input;
    return
end

end

