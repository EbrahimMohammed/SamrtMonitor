function splitImage (camName, imageName, image,signedUser)

rgbImage = imread(image);

% Get the dimensions of the image.  numberOfColorBands should be = 3.
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
numPlotsR = (size(ca, 1)) - 1;
numPlotsC = (size(ca, 2)) - 1;


for r = 1 : numPlotsR
	for c = 1 : numPlotsC
		
		rgbBlock = ca{r,c};
		[rowsB columnsB numberOfColorBandsB] = size(rgbBlock);
          nama = sprintf('Cameras/%s/%s/blocks/%s_%d.png',signedUser,camName, imageName, plotIndex );
          if (columnsB>0) && (rowsB>0) 
          imwrite (rgbBlock, nama, 'png');
          end;
		plotIndex = plotIndex + 1;
	end
end
