function [ output ] = overlap_regions( rect1, rect2 )
%   rect1 and rect2 are two rect, thie function calculate the overlap
%   suggested by  pascal visual object classes challenge.
%
%   rect is the target region:   rect(1) :the row number of top left
%                                rect(2) :the column number of top left
%                                rect(3) :the row number of bottom right
%                                rect(4) :the column number of bottom right
%   Detailed explanation goes here
r_top_left = max(rect1(1),rect2(1));
c_top_left = max(rect1(2),rect2(2));

r_bottom_right = min(rect1(3),rect2(3));
c_bottom_right = min(rect1(4),rect2(4));

if ((r_bottom_right < r_top_left)||(c_bottom_right < c_top_left))
    output = 0;
    return
else
    height = r_bottom_right - r_top_left;
    width = c_bottom_right - c_top_left;
    overlap_area = height*width;
    rect1_area = (rect1(3)-rect1(1))*(rect1(4)-rect1(2));
    rect2_area = (rect2(3)-rect2(1))*(rect2(4)-rect2(2));
    output = overlap_area/(rect1_area+rect2_area-overlap_area);
    return
end

end

