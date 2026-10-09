clear
close all
clc
%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% example1:
% f = [151    79    17
%      121   101    10
%      139    88   108];
% [LBP] = LocalBinaryPattern (f);
% figure
% subplot(121),imshow(f, []), title('orginal mat')
% subplot(122),imshow(LBP, []), title('LBP mat')
% example2:
at = imread('at_orjinal2.jpg');
at_gray = rgb2gray(at);
[at_LBP] = LocalBinaryPattern(at_gray);
figure
subplot(121),imshow(at, []), title('At 2')
subplot(122),imshow(at_LBP, []), title('LBP 2')
