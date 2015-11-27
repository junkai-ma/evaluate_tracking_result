function [ output ] = get_distance( c )
%GET_DISTANCE Summary of this function goes here
%   Detailed explanation goes here
len = size(c,1);
result = zeros(len,1);
for i = 1:len
   result(i) = norm(c(i,:)); 
end

output = result;

end

