clear
I = imread('kuslar.jpg');
% imshow(I);
%center = 128;
[y, x] = size(I); % in MATLAB, images are y-by-x in size (ie. y is dimension 1)
center_x = x/2;
center_y = y/2;
Original = I; % Original needs to be the image I
Rotated_I = zeros(y, x);
theta = 45;

for row = 1:y
    for column = 1:x
         x_original = (column - center_x) * cosd(theta) - (row - center_y)*sind(theta) + center_x; % theta is in degrees so use cosd and sind
         y_original = (column - center_x) * sind(theta) + (row - center_y)*cosd(theta) + center_y; % also add center back on

         p = floor(y_original); % x_original and y_original were swapped here
         q = floor(x_original); % x_original and y_original were swapped here
         a = y_original - p; 
         b = x_original - q;
         % check if the coordinate is in the original image to prevent errors
         if p > 0 && p <= y && q > 0 && q <= x
             Rotated_I(row, column) = Rotated_I(row, column) + (1-a)*(1-b)*Original(p,q);
         end
         if p > 0 && p <= y && q+1 > 0 && q+1 <= x
             Rotated_I(row, column) = Rotated_I(row, column) + (1-a)*b*Original(p,q+1);
         end
         if p+1 > 0 && p+1 <= y && q > 0 && q <= x
             Rotated_I(row, column) = Rotated_I(row, column) + a*(1-b)*Original(p+1,q);
         end
         if p+1 > 0 && p+1 <= y && q+1 > 0 && q+1 <= x
             Rotated_I(row, column) = Rotated_I(row, column) + a*b*Original(p+1,q+1);
         end
    end
end

% convert to uint image so it displays properly (double expects values from 0 to 1)
imshow(uint8(Rotated_I));