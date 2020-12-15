function sendTelemetry(camName,wastevolume,token)

wastevolume = wastevolume;
accessToken = getDeviceAccToken(camName,token);
url = sprintf('https://demo.thingsboard.io/api/v1/%s/telemetry',...
    accessToken);
options = weboptions('RequestMethod','POST','HeaderFields'...
    ,{'Content-Type' 'application/json';'X-Authorization' token});
data = struct('Wastevolume', wastevolume);

response = webwrite(url,data,options);


