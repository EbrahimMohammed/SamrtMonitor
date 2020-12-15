function customers = getCustomers(token)


url = 'https://demo.thingsboard.io/api/customers?limit=20';
options = weboptions('RequestMethod','GET','HeaderFields',{'Accept'...
    'application/json';'X-Authorization' token});
response = webread(url,options);
customers = {};
try
customers = extractfield(response.data, 'title');
catch
end


end

