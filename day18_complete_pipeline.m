% Day 18 - Complete Segmentation Pipeline
% Author: Viraj Patil

%% STEP 1: Load image
ct_image = phantom(256);

%% STEP 2: Enhance
denoised = medfilt2(ct_image, [3 3]);
enhanced = imadjust(denoised);

%% STEP 3: Segment
binary = imbinarize(enhanced, 0.2);

%% STEP 4: Find regions
[labeled, num_regions] = bwlabel(binary);
props = regionprops(labeled, 'Area', 'Centroid', 'BoundingBox');

%% STEP 5: Find largest region
all_areas = [props.Area];
[max_area, max_idx] = max(all_areas);
largest = labeled == max_idx;

%% STEP 6: Measurements
centroid = props(max_idx).Centroid;
bb = props(max_idx).BoundingBox;
fprintf('=== PIPELINE RESULTS ===\n');
fprintf('Regions found: %d\n', num_regions);
fprintf('Largest area: %d pixels\n', max_area);
fprintf('Centroid: (%.1f, %.1f)\n', centroid(1), centroid(2));

%% STEP 7: Final report figure
figure;
subplot(2, 3, 1); imshow(ct_image, []); title('1. Original');
subplot(2, 3, 2); imshow(denoised, []); title('2. Denoised');
subplot(2, 3, 3); imshow(enhanced, []); title('3. Enhanced');
subplot(2, 3, 4); imshow(binary); title('4. Segmented');
subplot(2, 3, 5); imshow(largest); title('5. Largest Region');
subplot(2, 3, 6);
imshow(ct_image, []); hold on;
rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 3);
plot(centroid(1), centroid(2), 'g+', 'MarkerSize', 15, 'LineWidth', 2);
title('6. Final Detection'); hold off;
sgtitle('Complete Medical Image Processing Pipeline - Day 18');

%% Save report
saveas(gcf, 'outputs/figures/day18_complete_pipeline.png');
disp('Pipeline complete! Report saved.');