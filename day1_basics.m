% Day 1 - MATLAB Basics for Medical Imaging
% Author: Viraj Patil
% Medical Systems Engineering - CT Image Processor Project

%% 1. Basic Variables
disp('=== MATLAB Basics for Medical Imaging ===');

heart_rate = 75;          % Single value
pixel_value = 128;        % Like one pixel in a CT scan
image_size = 512;         % Typical CT scan size

disp('Variables created successfully!');

%% 2. Matrices (the heart of MATLAB)
% A small fake CT slice - just numbers representing brightness
fake_ct_slice = [100 150 200; 50 128 180; 75 160 220];
disp('Fake CT slice (3x3 matrix):');
disp(fake_ct_slice);

% Check size - like checking CT image dimensions
[rows, cols] = size(fake_ct_slice);
fprintf('Image size: %d x %d pixels\n', rows, cols);

%% 3. Basic Math on Images
% In real CT processing, we do math on ALL pixels at once
brightened = fake_ct_slice + 50;    % Increase brightness
darkened = fake_ct_slice - 30;      % Decrease brightness
normalized = fake_ct_slice / 255;   % Normalize to 0-1 range

disp('Brightened CT slice:');
disp(brightened);

%% 4. Plot a fake heart rate signal
t = 0:0.01:2;
heart_signal = sin(2 * pi * 1.2 * t);  % 1.2 Hz = 72 bpm

figure;
plot(t, heart_signal, 'r', 'LineWidth', 2);
title('Simulated Heart Rate Signal');
xlabel('Time (seconds)');
ylabel('Signal Amplitude');
grid on;

disp('Day 1 Complete! Plot should be visible.');