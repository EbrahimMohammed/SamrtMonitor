function response = addUser(customer,email,firstName,lastName,token)

customerId = getCustomerIdByName(customer,token);
url = 'https://demo.thingsboard.io/api/user?sendActivationMail=true';
options = weboptions('RequestMethod','POST','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});
d= struct('entityType', 'CUSTOMER','id',customerId);
data = struct('customerId',d,'email',email,'firstName',firstName,'lastName',lastName,'authority','CUSTOMER_USER');
response = webwrite(url,data,options);

end
