function userId = getUserIdByName(customer, firstNameIn, lastNameIn,token)


customerId  = getCustomerIdByName(customer,token);
url = sprintf('https://demo.thingsboard.io/api/customer/%s/users?limit=100', customerId);
options = weboptions('RequestMethod','get','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});
response = webread(url, options);

id = extractfield(response.data,'id');

userId = '';

for i= 1:length(id)

    [firstName, lastName] = getUserById(id{i}.id,token);
    
    if(strcmp(firstName,firstNameIn) && strcmp(lastName, lastNameIn))
        userId = id{i}.id;
        break;
    end

end

end



