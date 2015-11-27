clear;
close all
clc

% to set the 
seq.dir = 'E:\track_dataset\TLD\10_panda\';
seq.image_suffix = '.jpg';
seq.name_len = 5;        %the length of the name of the image.
seq.start_frame = 1;
seq.end_frame = 100;
frame_len = seq.end_frame - seq.start_frame + 1;

% parameters below indicate the algorithm used to compare
target_rect(1).alg_name = 'MIL';
target_rect(1).alg_file = 'MIL.txt';

target_rect(2).alg_name = 'SemiBoost';
target_rect(2).alg_file = 'SemiBoost.txt';

% choose the evaluate methods
show_result_in_image = false;
average_location_error = true;
cal_precise = false;
overlap_threshold = 0.5;
successful_frame = true;
precise_threshold_curve = false;

% load the ground truth and the compared-algorithm result
ground_truth = load(strcat(seq.dir,'gt.txt'));

for i = 1:length(target_rect)
    file_name = strcat(seq.dir,target_rect(i).alg_file);
    target_rect(i).result = load(file_name);
end

%calculate the overlap rate of the algorithms respect to gt
overlap_score = calculate_overlap(target_rect,ground_truth, ...
                                  seq.start_frame,seq.end_frame);

%calculate the average location error
if average_location_error
    disp('calculate the average location error......');
    aver_error = cal_ALE(target_rect,ground_truth, ...
                         seq.start_frame,seq.end_frame);
end 

if show_result_in_image 
    show_image_diff_alg_results(seq);
end