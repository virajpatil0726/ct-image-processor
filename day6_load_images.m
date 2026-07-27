% Day 6 - Loading and Displaying Images
% Author: Viraj Patil 

%% 1. Create CT Phantom Image
ct_image = phantom(256);

%% 2. Display the image
figure;
imshow(ct_image, []);
title('My CT Image');

%% 3. Check image size
[rows, cols] = size(ct_image);
fprintf('Image size: %d x %d\n', rows, cols);

%% 4. Pixel range 
min_val = min(ct_image(:));
max_val = max(ct_image(:));
fprintf('Pixel range: %.2f to %.2f\n', min_val, max_val);

%% 5. Histogram 
figure;
imhist(ct_image);
title('Pixel Distribution');