function [ output ] = calculate_overlap( region_group,gt,s_num,e_num)
%CALCULATE_OVERLAP Summary of this function goes here
%   Detailed explanation goes here

len = e_num-s_num+1;
result = zeros(len,length(region_group));

for seq_n = 1:length(region_group)
    for frame_n = s_num:e_num
        result(frame_n,seq_n)=overlap_regions ...
                              (region_group(seq_n).result(frame_n,:), ...
                               gt(frame_n,:));
    end
end

result(isnan(result))=0;
output = result;


end

