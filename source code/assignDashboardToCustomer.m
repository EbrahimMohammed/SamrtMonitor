function response = assignDashboardToCustomer(customerName,dashboardName,token)

customerId = getCustomerIdByName(customerName,token);
dashboardId = getDashboardIdByName (dashboardName,token);
%token = getToken();
url = sprintf('https://demo.thingsboard.io/api/customer/%s/dashboard/%s'...
    ,customerId,dashboardId);
options = weboptions('RequestMethod','POST','HeaderFields',...
    {'Content-Type' 'application/json';'Accept'...
    'application/json';'X-Authorization' token});

response = webwrite(url,options);

end

