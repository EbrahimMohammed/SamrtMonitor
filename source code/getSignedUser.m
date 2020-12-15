function user = getSignedUser(token)
%curl -X GET --header 'Accept: application/json' --header 'X-Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoYWFtYWF0eWFAZ21haWwuY29tIiwic2NvcGVzIjpbIlRFTkFOVF9BRE1JTiJdLCJ1c2VySWQiOiJiMzUyYTA0MC02ZjBmLTExZTktYmJmNi1iMWY5OWVlOWY3NDkiLCJmaXJzdE5hbWUiOiJFYnJhIiwibGFzdE5hbWUiOiJBdHlhIiwiZW5hYmxlZCI6dHJ1ZSwicHJpdmFjeVBvbGljeUFjY2VwdGVkIjp0cnVlLCJpc1B1YmxpYyI6ZmFsc2UsInRlbmFudElkIjoiYjMyOGQxMjAtNmYwZi0xMWU5LWJiZjYtYjFmOTllZTlmNzQ5IiwiY3VzdG9tZXJJZCI6IjEzODE0MDAwLTFkZDItMTFiMi04MDgwLTgwODA4MDgwODA4MCIsImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNTc2MzI2NDI5LCJleHAiOjE1NzgxMjY0Mjl9.ORiBdFalU1s0lVA8GL1Kr8-lkh8-wM7yQNykZaO3Ae-TlzJUTCk5_rR61zAy7_DzIEsW-r3_z1w5YXahnub-uw' 'https://demo.thingsboard.io/api/auth/user'


url = 'https://demo.thingsboard.io/api/auth/user';

options = weboptions('RequestMethod','GET','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});
response = webread(url,options);

user = strcat(response.firstName , response.lastName);

end

