% Save all key output images for GitHub
cd('C:\Users\viraj\Documents\MATLAB\ct-image-processor')
ct_image = phantom(256);
denoised = medfilt2(ct_image, [3 3]);

% Day 4 - CT Phantom
figure('visible','off');
imshow(ct_image, []); colormap gray;
title('CT Phantom Image');
saveas(gcf, 'outputs/figures/day4_phantom.png');

% Day 9 - Enhancement
figure('visible','off');
subplot(1,3,1); imshow(ct_image,[]); title('Original');
subplot(1,3,2); imshow(imadjust(ct_image),[]); title('Enhanced');
subplot(1,3,3); imshow(histeq(ct_image),[]); title('Equalized');
sgtitle('Image Enhancement');
saveas(gcf, 'outputs/figures/day9_enhancement.png');

% Day 10 - Noise reduction
noisy = ct_image + 0.05 * randn(size(ct_image));
noisy = max(min(noisy,1),0);
figure('visible','off');
subplot(1,3,1); imshow(ct_image,[]); title('Original');
subplot(1,3,2); imshow(noisy,[]); title('Noisy');
subplot(1,3,3); imshow(medfilt2(noisy,[3 3]),[]); title('Denoised');
sgtitle('Noise Reduction');
saveas(gcf, 'outputs/figures/day10_noise.png');

% Day 12 - Edge detection
figure('visible','off');
subplot(1,3,1); imshow(ct_image,[]); title('Original');
subplot(1,3,2); imshow(edge(ct_image,'sobel')); title('Sobel');
subplot(1,3,3); imshow(edge(ct_image,'canny',[0.05 0.2])); title('Canny');
sgtitle('Edge Detection');
saveas(gcf, 'outputs/figures/day12_edges.png');

% Day 15 - Segmentation
figure('visible','off');
subplot(1,3,1); imshow(ct_image,[]); title('Original');
subplot(1,3,2); imshow(imbinarize(ct_image,0.1)); title('Low (0.1)');
subplot(1,3,3); imshow(imbinarize(ct_image,0.3)); title('Mid (0.3)');
sgtitle('Segmentation Thresholding');
saveas(gcf, 'outputs/figures/day15_segmentation.png');

disp('All output images saved!');
close all;