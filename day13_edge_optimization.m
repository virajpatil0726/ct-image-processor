% Day 13 - Edge Detection Optimization
% Author: Viraj Patil

%% Load and denoise CT image first
ct_image = phantom(256);
denoised = medfilt2(ct_image, [3 3]);

%% 1. Canny with different thresholds
canny_low = edge(denoised, 'canny', [0.01 0.1]);
canny_mid = edge(denoised, 'canny', [0.05 0.2]);
canny_high = edge(denoised, 'canny', [0.1 0.4]);

%% 2. Compare thresholds
figure;

subplot(2, 2, 1);
imshow(denoised, []);
title('Denoised CT');

subplot(2, 2, 2);
imshow(canny_low);
title('Canny Low Threshold');

subplot(2, 2, 3);
imshow(canny_mid);
title('Canny Mid Threshold');

subplot(2, 2, 4);
imshow(canny_high);
title('Canny High Threshold');

sgtitle('Day 13: Edge Detection Optimization');

%% 3. Overlay edges on original
figure;
imshow(denoised, []);
hold on;
[r, c] = find(canny_mid);
plot(c, r, 'r.', 'MarkerSize', 1);
title('Edge Overlay on CT Image');
hold off;

disp('Day 13 Complete!');