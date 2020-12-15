%funciton that gets the device attribute using the device Id

%{curl -v -X GET http://localhost:8080/api/plugins/telemetry/DEVICE/ac8e6020-ae99-11e6-b9bd-2b15845ada4e/values/attributes?keys=model,softwareVersion \--header "Content-Type:application/json" \--header "X-Authorization: $JWT_TOKEN"


function attributeOut = getDeviceAtt(camName, key,token)


id = getDeviceIdByName(camName,token);
url = sprintf('http://demo.thingsboard.io/api/plugins/telemetry/DEVICE/%s/values/attributes?keys=%s',id,key);
options = weboptions('RequestMethod','GET','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});
response = webread(url,options);

attributeOut = response.value;
end

