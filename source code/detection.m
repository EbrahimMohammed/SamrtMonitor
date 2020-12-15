%function [p1, p2] = detection (rgbImage)
%function p1 = detection (rgbImage)

function p1 = detection (camName, rgbImage,signedUser)





%Directories of required training files & load
trainingFeaturesDir = sprintf('Cameras/%s/%s/trainingFeatures2.mat',signedUser, camName);
trainingSetDir = sprintf('Cameras/%s/%s/trainingSet2.mat',signedUser, camName); 

load (trainingFeaturesDir);
load (trainingSetDir);
net = alexnet; 
featureLayer = 'fc7';
classifier = fitcecoc(trainingFeatures, trainingSet.Labels); %can try change other classifier -fitsvm -fitcecoc
[rows columns numberOfColorBands] = size(rgbImage);
%==========================================================================
% The first way to divide an image up into blocks is by using mat2cell().
blockSizeR = 60; % Rows in block.
blockSizeC = 80; % Columns in block.
% Figure out the size of each block in rows. 
% Most will be blockSizeR but there may be a remainder amount of less than that.
wholeBlockRows = floor(rows / blockSizeR);
blockVectorR = [blockSizeR * ones(1, wholeBlockRows), rem(rows, blockSizeR)];
% Figure out the size of each block in columns. 
wholeBlockCols = floor(columns / blockSizeC);
blockVectorC = [blockSizeC * ones(1, wholeBlockCols), rem(columns, blockSizeC)];
% Create the cell array, ca.  
% Each cell (except for the remainder cells at the end of the image)
% in the array contains a blockSizeR by blockSizeC by 3 color array.
% This line is where the image is actually divided up into blocks.
if numberOfColorBands > 1
	% It's a color image.
	ca = mat2cell(rgbImage, blockVectorR, blockVectorC, numberOfColorBands);
else
	ca = mat2cell(rgbImage, blockVectorR, blockVectorC);
end

% Now display all the blocks.
plotIndex = 1;
numPlotsR = (size(ca, 1))-1;
numPlotsC = (size(ca, 2))-1;

img1 = cell(numPlotsR,numPlotsC);
%img2 = cell(numPlotsR,numPlotsC);
for r = 1 : numPlotsR
	for c = 1 : numPlotsC
		% Extract the numerical array out of the cell
		rgbBlock = ca{r,c};
		[rowsB columnsB numberOfColorBandsB] = size(rgbBlock);
        img1{r,c} = classifyBlock_Waste(rgbBlock, net, featureLayer, classifier);
        %img2{r,c} = classifyBlock_Rain(rgbBlock, net, featureLayer, classifier);
        
		% Increment the subplot to the next location.
		plotIndex = plotIndex + 1;
	end
end

newimage1 = cell2mat(img1);
%figure (); imshow(newimage1, 'Border', 'tight');
%newimage2 = cell2mat(img2);
%figure(); imshow(newimage2, 'Border', 'tight');
p1 = lineBoundary (newimage1);
%p2 = lineBoundary (newimage2);

