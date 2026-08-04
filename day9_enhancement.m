% Day 9 - Image Enhancement
% Author: Viraj Patil

%% Load CT image
ct_image = phantom(256);

%% 1. Contrast adjustment
enhanced = imadjust(ct_image);

%% 2. Histogram equalization
equalized = histeq(ct_image);

%% 3. Compare side by side
figure;

subplot(1, 3, 1);
imshow(ct_image, []);
title('Original');

subplot(1, 3, 2);
imshow(enhanced, []);
title('Contrast Enhanced');

subplot(1, 3, 3);
imshow(equalized, []);
title('Histogram Equalized');

sgtitle('Day 9: Image Enhancement Comparison');

disp('Day 9 Complete!');