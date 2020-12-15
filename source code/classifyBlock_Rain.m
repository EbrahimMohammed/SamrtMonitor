function IMG2 = classifyBlock_Rain (rgbBlock, net, featureLayer, classifier)


% See details of the architecture 
%net.Layers 
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
    rgbBlock (1:r, 1:c, 1) = 255;
    rgbBlock (1:r, 1:c, 2) = 255;
    rgbBlock (1:r, 1:c, 3) = 255;
else
    rgbBlock (1:r, 1:c, 1) = 0;
    rgbBlock (1:r, 1:c, 2) = 0;
    rgbBlock (1:r, 1:c, 3) = 0;
end


%IMG1 = cat(3, grayImage, grayImage, grayImage);

%figure();
%imshow(rgbBlock);
%RGB  = rand(r, c, 3);  % RGB Image
R    = rgbBlock(:, :, 1);
G    = rgbBlock(:, :, 2);
B    = rgbBlock(:, :, 3);
IMG2 = cat(3, G, R, B);

