function assignDeviceToCustomer(cameraName, customer,token)

customerId = getCustomerIdByName(customer,token);
deviceId = getDeviceIdByName (cameraName,token);
url = sprintf('https://demo.thingsboard.io/api/customer/%s/device/%s', customerId, deviceId);
options = weboptions('RequestMethod','POST','HeaderFields',{'Content-Type' 'application/json';...
    'Accept' 'application/json';'X-Authorization' token});
response = webwrite(url,options);

end

