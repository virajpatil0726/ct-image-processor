% Day 14 - Morphlogical Operations 
% Autor: Viraj PAtil 

%% Load and get edges 
ct_image = phantom(256);
denoised = medfilt2(ct_image, [3 3]);
edges = edge (denoised, 'canny',[0.05 0.2]);

%% 1. Dilation 
se = strel('disk', 1);
dilatd = imdilate(edges, se);

%% 2. Erosion
eroded = imerode(edges, se);

%% 3. Closing
closed = imclose(edges, se);

%% 4. Opening  
opened = imopen(edges, se);

%% Compare all 
figure;

subplot(2, 3, 1);
imshow(edges);
title( 'Original Edges');

subplot(2, 3, 2);
imshow(dilatd);
title('Dilated (Thicker)');

subplot(2, 3, 3);
imshow(eroded);
title('Eroded (Thinner)');

subplot(2, 3, 4);
imshow(closed);
title('Closed (Fill Gaps)');

subplot(2, 3, 5);
imshow(opened);
title('Opened (Remove Noise)');

subplot(2, 3, 6);
imshow(ct_image, []);
title('Original CT');

sgtitle('Day 14: Morphological Operations');

disp('Day 14 Complete!'); 