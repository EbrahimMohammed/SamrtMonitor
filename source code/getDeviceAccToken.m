
function accessTokne = getDeviceAccToken(camName,token)

id = getDeviceIdByName(camName,token);
url = sprintf('https://demo.thingsboard.io/api/device/%s/credentials', id);
options = weboptions('RequestMethod','GET','HeaderFields',{'Accept' ...
    'application/json';'X-Authorization' token});

response = webread(url,options);
accessTokne= response.credentialsId;
