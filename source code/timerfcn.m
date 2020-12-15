function timerfcn(src,event)
camName = src.UserData{1};
token = src.UserData{2};
signedUser = src.UserData{3};

img = captureImg(camName,token);
clust = parcluster('local');
job = batch(clust, @startDetection , 0, {camName, img, signedUser,token})

end

