function response = addCamera(camName, camUrl, urlUserName, urlPass, period, longitude, latitude,token,signedUser)

url = 'https://demo.thingsboard.io/api/device';
options = weboptions('RequestMethod','post','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});
data = struct('name', camName, 'type', 'Camera');
response = webwrite(url,data,options);
DeviceAccessToken = getDeviceAccToken(camName,token);
saveAttributes(camName, period, camUrl, urlUserName, urlPass,longitude, latitude,DeviceAccessToken)
%save device attributes in thingsboard

%create the neccary camera file locally

%create paths for files
blocks = fullfile('Cameras',signedUser,camName,'blocks');
Dataset = fullfile('Cameras',signedUser,camName,'Dataset');
NB_WasteTrainMedium = fullfile('Cameras',signedUser,camName,'NB_WasteTrainMedium');
rain_water= fullfile('Cameras',signedUser,camName,'NB_WasteTrainMedium','rain_water');
new_bg1 = fullfile('Cameras',signedUser,camName,'NB_WasteTrainMedium','new_bg1');
waste = fullfile('Cameras',signedUser,camName,'NB_WasteTrainMedium','waste');
NewData = fullfile('Cameras',signedUser,camName, 'NewData');

%create the directories
mkdir (blocks);
mkdir (Dataset);
mkdir (NB_WasteTrainMedium);
mkdir (NewData);
mkdir (new_bg1);
mkdir (waste);
mkdir (rain_water);

end

