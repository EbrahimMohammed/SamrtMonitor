function myImg = captureImg(camName,token)

camUrl = getDeviceAtt(camName, 'URL',token); %get the camera URL or image path
userName = getDeviceAtt(camName, 'URLUSERNAME',token);
password = getDeviceAtt (camName, 'URLPASSWORD',token);

cam = ipcam(camUrl, userName, password);
myImg = snapshot(cam);

end

