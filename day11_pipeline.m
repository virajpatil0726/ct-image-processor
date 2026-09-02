% Day 11 - complete Enhancement Pipeline 
% Author: Viraj Patil 

%% Load CT image 
ct_image = phantom(256);

%% Run the complete pipeline 
disp('Running enhancement pipeline...');
enhanced = enhance_ct(ct_image, 1);

%% Show comparison 
figure;
subplot(1,2,1);
imshow(ct_image,[]);
title('Original');

subplot(1,2,2);
imshow(enhanced, []);
title('Enhanced');

sgtitle('Day 11: Complete Enhancemet Pipeline');
saveas(gcf,'outputs/figures/day11_pipeline.png');
disp('Pipeline complete! Result saved.');

%% ---- PIPELINE FUNCTION ----
function output = enhance_ct(image, sigma)
    % Step 1: Denoise
    denoised = medfilt2(image, [3 3]);
    
    % Step 2: Contrast enhancement
    contrasted = imadjust(denoised);
    
    % Step 3: Histogram equalization
    output = histeq(contrasted);
    
    disp('Enhancement steps: Denoise → Contrast → Equalize');
end