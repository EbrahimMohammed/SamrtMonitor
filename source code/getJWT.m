function token = getJWT(email,password)
url = 'https://demo.thingsboard.io/api/auth/login';
options = weboptions('RequestMethod','POST','HeaderFields',{'Content-Type' 'application/json'; 'Accept' 'application/json'});
data = struct('username', email, 'password',password);
response = webwrite(url,data,options);
token = ['Bearer ' response.token];

end



