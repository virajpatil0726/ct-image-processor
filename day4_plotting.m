% Day 4 - Plotting and Saving Figures
% Author: Viraj Patil
% Medical Systems Engineering - CT Image Processor Project

%% 1. Create a fake CT scan using MATLAB's phantom function
% phantom() creates a standard test image used in CT research worldwide!
disp('=== Day 4: Plotting and Saving Figures ===');

ct_image = phantom(256);  % Creates a 256x256 fake CT brain-like image
disp('Phantom CT image created!');
fprintf('Image size: %d x %d pixels\n', size(ct_image, 1), size(ct_image, 2));
fprintf('Pixel range: %.2f to %.2f\n', min(ct_image(:)), max(ct_image(:)));

%% 2. Display the image
figure(1);
imshow(ct_image, []);
title('Phantom CT Image (Standard Medical Test Image)');
colorbar;
colormap gray;

%% 3. Show its histogram
figure(2);
imhist(ct_image);
title('Pixel Value Distribution of CT Image');
xlabel('Pixel Intensity');
ylabel('Count');

%% 4. Create a 2x2 subplot showing different views
figure(3);

% Original
subplot(2, 2, 1);
imshow(ct_image, []);
title('Original CT');
colormap gray;

% Brightened
subplot(2, 2, 2);
brightened = ct_image + 0.2;
brightened = min(brightened, 1);  % Cap at 1
imshow(brightened, []);
title('Brightened');

% Darkened
subplot(2, 2, 3);
darkened = ct_image - 0.2;
darkened = max(darkened, 0);  % Floor at 0
imshow(darkened, []);
title('Darkened');

% Inverted (like X-ray negative)
subplot(2, 2, 4);
inverted = 1 - ct_image;
imshow(inverted, []);
title('Inverted (X-ray style)');

sgtitle('CT Image Variations - Day 4');

%% 5. Save the figure
saveas(figure(3), 'day4_ct_variations.png');
disp('Figure saved as day4_ct_variations.png');

disp('Day 4 Complete!');