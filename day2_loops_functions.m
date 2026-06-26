% Day 2 - Loops, Conditions and Functions
% Author: Viraj Patil
% Medical Systems Engineering - CT Image Processor Project

%% 1. FOR LOOP - Repeat something multiple times
disp('=== Loops and Conditions ===');

% Loop through 10 fake heart rate readings
heart_rates = [72 85 95 110 68 75 102 88 91 78];

for i = 1:10
    fprintf('Reading %d: Heart Rate = %d bpm\n', i, heart_rates(i));
end

%% 2. IF/ELSE - Make decisions
disp('--- Alert Check ---');

for i = 1:10
    hr = heart_rates(i);
    if hr > 100
        fprintf('Reading %d: %d bpm - WARNING HIGH!\n', i, hr);
    elseif hr < 60
        fprintf('Reading %d: %d bpm - WARNING LOW!\n', i, hr);
    else
        fprintf('Reading %d: %d bpm - Normal\n', i, hr);
    end
end

%% 3. WHILE LOOP
disp('--- Counting pixels above threshold ---');

pixel_values = [50 120 200 30 180 90 250 45 170 110];
count = 0;
i = 1;

while i <= length(pixel_values)
    if pixel_values(i) > 100
        count = count + 1;
    end
    i = i + 1;
end

fprintf('Pixels above threshold (100): %d out of %d\n', count, length(pixel_values));

%% 4. YOUR FIRST FUNCTION
% Functions in MATLAB go at the BOTTOM of the script or in separate files
% Let's call our function here:
disp('--- Testing check_pixel function ---');

test_pixels = [50 128 200 75 180];
for i = 1:length(test_pixels)
    status = check_pixel(test_pixels(i));
    fprintf('Pixel value %d: %s\n', test_pixels(i), status);
end

disp('Day 2 Complete!');

%% ---- FUNCTION DEFINITION (always at the bottom) ----
function status = check_pixel(pixel_value)
    % This function checks if a pixel value is dark, medium or bright
    % Just like checking CT scan pixel intensities!
    if pixel_value < 85
        status = 'Dark (background)';
    elseif pixel_value < 170
        status = 'Medium (soft tissue)';
    else
        status = 'Bright (bone/dense tissue)';
    end
end