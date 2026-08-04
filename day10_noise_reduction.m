% Day 10 - Noise Reduction
% Author: Viraj Patil

%% Load CT image
ct_image = phantom(256);

%% 1. Add artificial noise
noisy = ct_image + 0.05 * randn(size(ct_image));
noisy = max(min(noisy, 1), 0);

%% 2. Gaussian filter
gaussian = imgaussfilt(noisy, 1);

%% 3. Median filter
median_filtered = medfilt2(noisy, [3 3]);

%% 4. Compare all four
figure;

subplot(2, 2, 1);
imshow(ct_image, []);
title('Original Clean');

subplot(2, 2, 2);
imshow(noisy, []);
title('Noisy CT');

subplot(2, 2, 3);
imshow(gaussian, []);
title('Gaussian Filter');

subplot(2, 2, 4);
imshow(median_filtered, []);
title('Median Filter');

sgtitle('Day 10: Noise Reduction Comparison');

disp('Day 10 Complete!');    