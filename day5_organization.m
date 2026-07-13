% Day 5 - Project Organization and Saving Results
% Author: Viraj Patil
% Medical Systems Engineering - CT Image Processor Project

%% Setup - Create organized folder structure
disp('=== Day 5: Project Organization ===');

% Create output folders if they don't exist
if ~exist('outputs', 'dir')
    mkdir('outputs');
    disp('Created outputs folder');
end

if ~exist('outputs/figures', 'dir')
    mkdir('outputs/figures');
    disp('Created outputs/figures folder');
end

if ~exist('outputs/data', 'dir')
    mkdir('outputs/data');
    disp('Created outputs/data folder');
end

%% Load our phantom CT image
ct_image = phantom(256);
disp('CT phantom image loaded!');

%% Process the image (combining what we learned Days 1-4)
% Step 1: Get image statistics
img_min = min(ct_image(:));
img_max = max(ct_image(:));
img_mean = mean(ct_image(:));
img_std = std(ct_image(:));

fprintf('\n--- Image Statistics ---\n');
fprintf('Min pixel value: %.4f\n', img_min);
fprintf('Max pixel value: %.4f\n', img_max);
fprintf('Mean pixel value: %.4f\n', img_mean);
fprintf('Std deviation: %.4f\n', img_std);

%% Create a comprehensive report figure
figure('Position', [100 100 900 600]);

% Original CT
subplot(2, 3, 1);
imshow(ct_image, []);
title('Original CT Phantom');
colormap gray;

% Brightened
subplot(2, 3, 2);
brightened = min(ct_image + 0.2, 1);
imshow(brightened, []);
title('Brightened (+0.2)');

% Darkened
subplot(2, 3, 3);
darkened = max(ct_image - 0.2, 0);
imshow(darkened, []);
title('Darkened (-0.2)');

% Inverted
subplot(2, 3, 4);
inverted = 1 - ct_image;
imshow(inverted, []);
title('Inverted (X-ray style)');

% Histogram
subplot(2, 3, 5);
imhist(ct_image);
title('Pixel Distribution');
xlabel('Intensity');
ylabel('Count');

% Statistics text
subplot(2, 3, 6);
axis off;
text(0.1, 0.9, 'Image Statistics:', 'FontSize', 12, 'FontWeight', 'bold');
text(0.1, 0.75, sprintf('Min: %.4f', img_min), 'FontSize', 10);
text(0.1, 0.60, sprintf('Max: %.4f', img_max), 'FontSize', 10);
text(0.1, 0.45, sprintf('Mean: %.4f', img_mean), 'FontSize', 10);
text(0.1, 0.30, sprintf('Std: %.4f', img_std), 'FontSize', 10);
text(0.1, 0.15, sprintf('Size: %dx%d', size(ct_image,1), size(ct_image,2)), 'FontSize', 10);

sgtitle('CT Image Processing Report - Day 5', 'FontSize', 14, 'FontWeight', 'bold');

%% Save the figure
saveas(gcf, 'outputs/figures/day5_report.png');
disp('Report saved to outputs/figures/day5_report.png');

%% Save statistics to a text file
fileID = fopen('outputs/data/image_stats.txt', 'w');
fprintf(fileID, 'CT Image Processing Statistics\n');
fprintf(fileID, '==============================\n');
fprintf(fileID, 'Date: %s\n', datestr(now));
fprintf(fileID, 'Image Size: %dx%d\n', size(ct_image,1), size(ct_image,2));
fprintf(fileID, 'Min Pixel: %.4f\n', img_min);
fprintf(fileID, 'Max Pixel: %.4f\n', img_max);
fprintf(fileID, 'Mean Pixel: %.4f\n', img_mean);
fprintf(fileID, 'Std Deviation: %.4f\n', img_std);
fclose(fileID);
disp('Statistics saved to outputs/data/image_stats.txt');

disp('Day 5 Complete! Project is now properly organized.');