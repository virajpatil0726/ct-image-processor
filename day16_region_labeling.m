% Day 16 - Region Labeling and Measurements
% Author: Viraj Patil

%% Load and segment CT image
ct_image = phantom(256);
binary = imbinarize(ct_image, 0.2);

%% 1. Label connected regions
[labeled, num_regions] = bwlabel(binary);
fprintf('Number of regions found: %d\n', num_regions);

%% 2. Measure region properties
props = regionprops(labeled, 'Area', 'Centroid', 'BoundingBox');

%% 3. Display results
figure;
subplot(1, 3, 1);
imshow(ct_image, []);
title('Original CT');

subplot(1, 3, 2);
imshow(binary);
title('Segmented');

subplot(1, 3, 3);
imshow(binary);
title('Labeled Regions');
hold on;

%% 4. Draw bounding box around each region
for i = 1:num_regions
    bb = props(i).BoundingBox;
    rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 2);
    fprintf('Region %d: Area = %d pixels\n', i, props(i).Area);
end
hold off;

sgtitle('Day 16: Region Labeling and Measurements');
disp('Day 16 Complete!');