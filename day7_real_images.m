% Day 7 - Real MRI Images
% Author: Viraj Patil

%% Load the built-in MRI dataset
load mri;

%% Extract slice 13 (middle of brain)
slice = D(:, :, 1, 13);

%% Display it
figure;
imshow(slice, []);
title('Real MRI Brain Scan - Slice 13');
colormap(gray);

%% Check size
fprintf('MRI slice size: %d x %d\n', size(slice, 1), size(slice, 2));


%% Show all 27 slices
figure;
for i = 1:27
    subplot(3, 9, i);
    imshow(D(:,:,1,i), []);
    title(sprintf('Slice %d', i));
end
colormap(gray);
sgtitle('All 27 MRI Brain Slices');