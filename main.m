% Required MATLAB Toolboxes:
% - Image Processing Toolbox
% - Statistics and Machine Learning Toolbox
% ================================================
% CT Medical Image Processing Pipeline
% Author: Viraj Patil
% Medical Systems Engineering
% Otto-von-Guericke-Universität Magdeburg
% ================================================

clc; clear; close all;

disp('=========================================');
disp('  CT Medical Image Processing Pipeline');
disp('  Author: Viraj Patil');
disp('  Project ');
disp('=========================================');

%% Run complete pipeline
disp('Loading CT image...');
ct_image = phantom(256);

disp('Enhancing image...');
denoised = medfilt2(ct_image, [3 3]);
enhanced = imadjust(denoised);

disp('Detecting edges...');
edges = edge(enhanced, 'canny', [0.05 0.2]);

disp('Segmenting regions...');
binary = imbinarize(enhanced, 0.2);
[labeled, num_regions] = bwlabel(binary);
props = regionprops(labeled, 'Area', 'Centroid', 'BoundingBox');

disp('Finding largest region...');
all_areas = [props.Area];
[max_area, max_idx] = max(all_areas);
largest = labeled == max_idx;
centroid = props(max_idx).Centroid;
bb = props(max_idx).BoundingBox;

%% Print results
disp(' ');
disp('========= PIPELINE RESULTS =========');
fprintf('Regions detected: %d\n', num_regions);
fprintf('Largest region: %d pixels\n', max_area);
fprintf('Centroid: (%.1f, %.1f)\n', centroid(1), centroid(2));
disp('====================================');

%% Generate final report
figure('Position', [100 100 1200 700]);
subplot(2,3,1); imshow(ct_image,[]); title('1. Original CT');
subplot(2,3,2); imshow(enhanced,[]); title('2. Enhanced');
subplot(2,3,3); imshow(edges); title('3. Edge Detection');
subplot(2,3,4); imshow(binary); title('4. Segmented');
subplot(2,3,5); imshow(largest); title('5. Largest Region');
subplot(2,3,6);
imshow(ct_image,[]); hold on;
rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 3);
plot(centroid(1), centroid(2), 'g+', 'MarkerSize', 20, 'LineWidth', 3);
title('6. Final Detection'); hold off;
sgtitle('CT Medical Image Processing Pipeline - Viraj Patil', 'FontSize', 14);

%% Save final report
saveas(gcf, 'outputs/figures/final_report.png');

disp(' ');
disp('Pipeline complete!');