% Day 17 - Finding Largest Region
% Author: Viraj Patil

%% Load and segment CT image
ct_image = phantom(256);
binary = imbinarize(ct_image, 0.2);

%% 1. Label regions
[labeled, num_regions] = bwlabel(binary);
props = regionprops(labeled, 'Area', 'Centroid', 'BoundingBox');

%% 2. Find LARGEST region
all_areas = [props.Area];
[max_area, max_idx] = max(all_areas);
fprintf('Largest region: Region %d with %d pixels\n', max_idx, max_area);

%% 3. Isolate largest region
largest = labeled == max_idx;

%% 4. Display results
figure;
subplot(1, 3, 1);
imshow(ct_image, []);
title('Original CT');

subplot(1, 3, 2);
imshow(binary);
title('All Regions');

subplot(1, 3, 3);
imshow(largest);
title('Largest Region Only');
hold on;
bb = props(max_idx).BoundingBox;
rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 3);
hold off;

sgtitle('Day 17: Largest Region Detection');
disp('Day 17 Complete!');