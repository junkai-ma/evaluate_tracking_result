function [ output ] = get_rect_center( rects )
%GET_RECT_CENTER Summary of this function goes here
%   Detailed explanation goes here
output = zeros(size(rects,1),2);
output(:,1) = (rects(:,1)+rects(:,3))/2;
output(:,2) = (rects(:,2)+rects(:,4))/2;

end

