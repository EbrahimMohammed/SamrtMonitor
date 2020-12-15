function [segImg, volume] = gaborSeg (imgD)

img = imgD;
Agray = rgb2gray(img);
imageSize = size(img);
numRows = imageSize(1);
numCols = imageSize(2);

%design orientation
wavelengthMin = 4/sqrt(2);
wavelengthMax = hypot(numRows,numCols);
n = floor(log2(wavelengthMax/wavelengthMin));
wavelength = 2.^(0:(n-2)) * wavelengthMin;

deltaTheta = 45;
orientation = 0:deltaTheta:(180-deltaTheta);

g = gabor(wavelength,orientation);

%gabor magnitude
gabormag = imgaborfilt(Agray,g);

%normalize gabor magnitude into gabor features
for i = 1:length(g)
    sigma = 0.5*g(i).Wavelength;
    K = 3;
    gabormag(:,:,i) = imgaussfilt(gabormag(:,:,i),K*sigma); 
end

%map spatial location and grouping close location
X = 1:numCols;
Y = 1:numRows;
[X,Y] = meshgrid(X,Y);
featureSet = cat(3,gabormag,X);
featureSet = cat(3,featureSet,Y);

%reshape by the kmeans function (24 gabor features + 2 spatial features)
%numPoints = numRows*numCols;
X = reshape(featureSet,numRows*numCols,[]);

%normalize the features
X = bsxfun(@minus, X, mean(X));
X = bsxfun(@rdivide,X,std(X));

%use pca to move 26D features to 1D
coeff = pca(X);
feature2DImage = reshape(X*coeff(:,1),numRows,numCols);

%overlay waste region with detected region
bw2 = im2bw(feature2DImage);
volume = CalculateArea(bw2);
segImg = labeloverlay(img,bw2);