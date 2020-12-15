function customerDevices = getCustomerDevices(customerName,token)
customerId = getCustomerIdByName(customerName,token);
url = sprintf('https://demo.thingsboard.io/api/customer/%s/devices?limit=20',customerId);
options = weboptions('RequestMethod','GET','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});
response = webread(url, options);
customerDevices = extractfield(response.data, 'name');
end

