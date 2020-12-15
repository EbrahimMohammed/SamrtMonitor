function id = getCustomerIdByName(name,token)

url = sprintf('https://demo.thingsboard.io/api/tenant/customers?customerTitle=%s',name);
options = weboptions('RequestMethod','GET','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});
response = webread(url, options);
id =response.id.id;

end


