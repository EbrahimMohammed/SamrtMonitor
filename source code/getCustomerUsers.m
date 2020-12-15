function   users = getCustomerUsers(customer,token)
%curl -X GET --header 'Accept: application/json' --header 'X-Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoYWFtYWF0eWFAZ21haWwuY29tIiwic2NvcGVzIjpbIlRFTkFOVF9BRE1JTiJdLCJ1c2VySWQiOiJiMzUyYTA0MC02ZjBmLTExZTktYmJmNi1iMWY5OWVlOWY3NDkiLCJmaXJzdE5hbWUiOiJFYnJhIiwibGFzdE5hbWUiOiJBdHlhIiwiZW5hYmxlZCI6dHJ1ZSwicHJpdmFjeVBvbGljeUFjY2VwdGVkIjp0cnVlLCJpc1B1YmxpYyI6ZmFsc2UsInRlbmFudElkIjoiYjMyOGQxMjAtNmYwZi0xMWU5LWJiZjYtYjFmOTllZTlmNzQ5IiwiY3VzdG9tZXJJZCI6IjEzODE0MDAwLTFkZDItMTFiMi04MDgwLTgwODA4MDgwODA4MCIsImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNTcxOTA3ODkwLCJleHAiOjE1NzM3MDc4OTB9.uuXThsnfHP0ukDiOVWNP09-u16QK4ktNFmfyQgLS9My77dInWoHI5n7bRo0fG2tuUt9NkGJ1EPVnmCoP9QIwMQ' 'https://demo.thingsboard.io/api/customer/86e696d0-df74-11e9-bc72-e9d230655396/users?limit=1'

id  = getCustomerIdByName(customer,token);
url = sprintf('https://demo.thingsboard.io/api/customer/%s/users?limit=100', id);
options = weboptions('RequestMethod','get','HeaderFields',{'Accept' 'application/json'...
    ;'X-Authorization' token});
response = webread(url, options);

firstName = extractfield(response.data, 'firstName');
lastName = extractfield(response.data, 'lastName');

users = strcat(firstName, {' '}, lastName);
end

