% Day 19 - Final Demo Script
% Author: Viraj Patil
% Medical Systems Engineering - DLR Internship Preparation

%% Complete pipeline in one clean script
disp('=== CT Medical Image Processing Pipeline ===');
disp('Author: Viraj Patil');
disp('Field: Medical Systems Engineering');
disp('Purpose: DLR Cardiovascular Aerospace Medicine');

%% Load
ct_image = phantom(256);
fprintf('Image loaded: %dx%d pixels\n', size(ct_image,1), size(ct_image,2));

%% Enhance
disp('Step 1: Enhancing image...');
denoised = medfilt2(ct_image, [3 3]);
enhanced = imadjust(denoised);

%% Detect edges
disp('Step 2: Detecting edges...');
edges = edge(enhanced, 'canny', [0.05 0.2]);

%% Segment
disp('Step 3: Segmenting regions...');
binary = imbinarize(enhanced, 0.2);
[labeled, num_regions] = bwlabel(binary);
props = regionprops(labeled, 'Area', 'Centroid', 'BoundingBox');

%% Find largest
all_areas = [props.Area];
[max_area, max_idx] = max(all_areas);
largest = labeled == max_idx;
centroid = props(max_idx).Centroid;
bb = props(max_idx).BoundingBox;

%% Print results
disp('=== RESULTS ===');
fprintf('Regions detected: %d\n', num_regions);
fprintf('Largest region area: %d pixels\n', max_area);
fprintf('Centroid location: (%.1f, %.1f)\n', centroid(1), centroid(2));

%% Final 6-panel report
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

%% Save
saveas(gcf, 'outputs/figures/day19_final_demo.png');
disp('Final demo complete!');