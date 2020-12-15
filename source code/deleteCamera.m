function response = deleteCamera(camName,token)
%curl -X DELETE --header 'Accept: application/json' 'https://demo.thingsboard.io/api/device/c3a300d0-f596-11e9-9cef-cf7397cc2c36'

id = getDeviceIdByName(camName,token);

url = sprintf('https://demo.thingsboard.io/api/device/%s',id)
options = weboptions('RequestMethod','DELETE','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});

response = webwrite(url, options);



end

