% Day 12 - Edge Detection
% Author: Viraj Patil

%% Load CT image
ct_image = phantom(256);

%% 1. Sobel edge detection
sobel_edges = edge(ct_image, 'sobel');

%% 2. Canny edge detection
canny_edges = edge(ct_image, 'canny');

%% 3. Compare results
figure;

subplot(1, 3, 1);
imshow(ct_image, []);
title('Original CT');

subplot(1, 3, 2);
imshow(sobel_edges);
title('Sobel Edges');

subplot(1, 3, 3);
imshow(canny_edges);
title('Canny Edges');

sgtitle('Day 12: Edge Detection Comparison');

%% 4. Count edges detected
sobel_count = sum(sum(sobel_edges));
canny_count = sum(sum(canny_edges));
fprintf('Sobel edge pixels: %d\n', sobel_count);
fprintf('Canny edge pixels: %d\n', canny_count);

disp('Day 12 Complete!');