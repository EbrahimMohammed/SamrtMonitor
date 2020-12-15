
function trainFeatures(camName,signedUser)
% Access the trained model 
net = alexnet; 
featureLayer = 'fc7';



rootFolder = sprintf('Cameras/%s/%s/NB_WasteTrainMedium',signedUser, camName);
categories = {'new_bg1', 'rain_water', 'waste'};
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
imds.ReadFcn = @readFunctionTrain;
[trainingSet, ~] = splitEachLabel(imds, 0.7, 'randomize');
trainingFeatures = activations(net, trainingSet, featureLayer, 'OutputAs', 'rows');
trainFeaturesDir = sprintf('Cameras/%s/%s/trainingFeatures2.mat',signedUser, camName);
trainSetDir = sprintf('Cameras/%s/%s/trainingSet2.mat',signedUser,camName);
save(trainFeaturesDir,'trainingFeatures');
save(trainSetDir,'trainingSet');
