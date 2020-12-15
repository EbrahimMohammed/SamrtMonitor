function IMG1 = classifyBlock_Waste (rgbBlock, net, featureLayer, classifier)


% See details of the architecture 
 
I = rgbBlock; 
% Adjust size of the image 
I = imresize(I, [227 227]);
sz = net.Layers(1).InputSize; 
I = I(1:sz(1),1:sz(2),1:sz(3)); 

testFeatures = activations(net, I, featureLayer, 'OutputAs', 'rows');
predictedLabels = predict(classifier, testFeatures);

[r, c, z] = size (rgbBlock);

if (predictedLabels == 'new_bg1')
    rgbBlock (1:r, 1:c, 1) = 0;
    rgbBlock (1:r, 1:c, 2) = 0;
    rgbBlock (1:r, 1:c, 3) = 0; 
elseif (predictedLabels == 'rain_water')
    rgbBlock (1:r, 1:c, 1) = 0;
    rgbBlock (1:r, 1:c, 2) = 0;
    rgbBlock (1:r, 1:c, 3) = 0;
else
    rgbBlock (1:r, 1:c, 1) = 255;
    rgbBlock (1:r, 1:c, 2) = 255;
    rgbBlock (1:r, 1:c, 3) = 255;
end

R    = rgbBlock(:, :, 1);
G    = rgbBlock(:, :, 2);
B    = rgbBlock(:, :, 3);
IMG1 = cat(3, G, R, B);

%block detected as waste will be in white color, otherwise, it will be
%black