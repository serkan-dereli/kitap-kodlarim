% MATLAB Code | Prewitt Operator from Scratch

% Read Input Image
res = imread('parca5.png');

% Displaying Input Image
res = uint8(res);
figure, imshow(res); title('Orjinal');

% Convert the truecolor RGB image to the grayscale image
res = rgb2gray(res);

% Convert the image to double
res = double(res);

% Pre-allocate the filtered_image matrix with zeros
filtered_image = zeros(size(res));
Gx = zeros(size(res));
Gy = zeros(size(res));

% Prewitt Operator Mask
Mx = [-1 0 1; -1 0 1; -1 0 1];
My = [-1 -1 -1; 0 0 0; 1 1 1];

% Edge Detection Process
% When i = 1 and j = 1, then filtered_image pixel
% position will be filtered_image(2, 2)
% The mask is of 3x3, so we need to traverse
% to filtered_image(size(input_image, 1) - 2
%, size(input_image, 2) - 2)
% Thus we are not considering the borders.
for i = 1:size(res, 1) - 2
	for j = 1:size(res, 2) - 2

		% Gradient approximations
		Gx(i,j) = sum(sum(Mx.*res(i:i+2, j:j+2)));
		Gy(i,j) = sum(sum(My.*res(i:i+2, j:j+2)));
				
		% Calculate magnitude of vector
		filtered_image(i+1, j+1) = sqrt(Gx(i,j).^2 + Gy(i,j).^2);
		
	end
end

figure; imshow(Gx); title('Yatay Tarama - Gx');
figure; imshow(Gy); title('Dikey Tarama - Gy');

% Displaying Filtered Image
filtered_image = uint8(filtered_image);
figure, imshow(filtered_image); title('Filtrelenmiþ Görüntü');

% Eþikleme deðeri belirleniyor
thresholdValue = 10; % varies between [0 255]
output_image = max(filtered_image, thresholdValue);
output_image(output_image == round(thresholdValue)) = 0;

% Çýktý
output_image = im2bw(output_image);
figure, imshow(output_image); title('Prewitt Kenar Tespiti');
