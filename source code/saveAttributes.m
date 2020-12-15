function response = saveAttributes(camName, period, camUrl, urlUserName, urlPass,longitude, latitude,deviceAccToken)

url = sprintf('http://demo.thingsboard.io/api/v1/%s/attributes', deviceAccToken);
options = weboptions('RequestMethod','post','HeaderFields',{'Content-Type' 'application/json'});
data = struct('NAME', camName,'PERIOD', period,'URL', camUrl, 'URLUSERNAME',urlUserName,'URLPASSWORD',urlPass,...
    'latitude',latitude, 'longitude', longitude);
response = webwrite(url, data, options)