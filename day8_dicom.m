% Day 8 - Loading DICOM Files
% Author: Viraj Patil

info = dicominfo('sample_ct.dcm');

disp('--- DICOM File Information ---');
fprintf('Modality: %s\n', info.Modality);
fprintf('Rows: %d\n', info.Rows);
fprintf('Columns: %d\n', info.Columns);

ct_dicom = dicomread('sample_ct.dcm');

figure;
imshow(ct_dicom, []);
title('Real DICOM CT Image');
colormap(gray);

fprintf('Image size: %d x %d\n', size(ct_dicom, 1), size(ct_dicom, 2));
fprintf('Pixel range: %d to %d\n', min(ct_dicom(:)), max(ct_dicom(:)));

disp('Day 8 Complete!');