% Day 3 - Functions in MATLAB
% Author: Viraj Patil
% Medical Systems Engineering - CT Image Processor Project

%% Call our functions and see results
disp('=== MATLAB Functions for Medical Imaging ===');

%% 1. Test pixel classifier on a fake CT row
ct_row = [20 45 128 200 180 90 30 155 220 60];

disp('--- CT Pixel Analysis ---');
for i = 1:length(ct_row)
    tissue = classify_tissue(ct_row(i));
    fprintf('Pixel %d: Value=%d -> %s\n', i, ct_row(i), tissue);
end

%% 2. Test image statistics function
disp('--- Image Statistics ---');
fake_image = [100 150 200; 50 128 180; 75 160 220];
[mn, mx, avg] = image_stats(fake_image);
fprintf('Min pixel: %d\n', mn);
fprintf('Max pixel: %d\n', mx);
fprintf('Average pixel: %.2f\n', avg);

%% 3. Test brightness adjustment function
disp('--- Brightness Adjustment ---');
original = [100 150 200; 50 128 180; 75 160 220];
brightened = adjust_brightness(original, 50);
darkened = adjust_brightness(original, -30);

disp('Original image:');
disp(original);
disp('Brightened by 50:');
disp(brightened);
disp('Darkened by 30:');
disp(darkened);

%% 4. Plot pixel distribution
figure;
histogram(ct_row, 5);
title('Pixel Value Distribution (like CT Histogram)');
xlabel('Pixel Value (0=dark, 255=bright)');
ylabel('Count');
grid on;

disp('Day 3 Complete!');

%% ---- FUNCTION DEFINITIONS ----

function tissue_type = classify_tissue(pixel_value)
    % Classifies CT pixel into tissue type
    % Based on simplified Hounsfield Unit ranges
    if pixel_value < 50
        tissue_type = 'Air/Background';
    elseif pixel_value < 100
        tissue_type = 'Fat tissue';
    elseif pixel_value < 160
        tissue_type = 'Soft tissue';
    elseif pixel_value < 210
        tissue_type = 'Dense tissue';
    else
        tissue_type = 'Bone';
    end
end

function [min_val, max_val, mean_val] = image_stats(image)
    % Returns basic statistics of an image matrix
    min_val = min(image(:));
    max_val = max(image(:));
    mean_val = mean(image(:));
end

function result = adjust_brightness(image, amount)
    % Adjusts image brightness by adding/subtracting a value
    % Clamps result between 0 and 255 (valid pixel range)
    result = image + amount;
    result = max(result, 0);    % No pixel below 0
    result = min(result, 255);  % No pixel above 255
end