function authenticateUser(email,password)
url = 'https://demo.thingsboard.io/api/auth/login';
options = weboptions('RequestMethod','POST','HeaderFields',{'Content-Type' 'application/json'; 'Accept' 'application/json'});
data = struct('username', email, 'password',password);

response = webwrite(url,data,options);

token = response.token;


fileID = fopen('Token.txt','w');
fprintf(fileID, 'Bearer %s',token);
fclose(fileID);

fileID = fopen('signedUser.txt','w');
fprintf(fileID, email);
fclose(fileID);
end

