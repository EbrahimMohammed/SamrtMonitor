function [firstName, lastName] = getUserById(id,token)
%curl -X GET --header 'Accept: application/json' --header 'X-Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoYWFtYWF0eWFAZ21haWwuY29tIiwic2NvcGVzIjpbIlRFTkFOVF9BRE1JTiJdLCJ1c2VySWQiOiJiMzUyYTA0MC02ZjBmLTExZTktYmJmNi1iMWY5OWVlOWY3NDkiLCJmaXJzdE5hbWUiOiJFYnJhIiwibGFzdE5hbWUiOiJBdHlhIiwiZW5hYmxlZCI6dHJ1ZSwicHJpdmFjeVBvbGljeUFjY2VwdGVkIjp0cnVlLCJpc1B1YmxpYyI6ZmFsc2UsInRlbmFudElkIjoiYjMyOGQxMjAtNmYwZi0xMWU5LWJiZjYtYjFmOTllZTlmNzQ5IiwiY3VzdG9tZXJJZCI6IjEzODE0MDAwLTFkZDItMTFiMi04MDgwLTgwODA4MDgwODA4MCIsImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNTczODA4NzAyLCJleHAiOjE1NzU2MDg3MDJ9.Jx4O5Be26wEUuHr9Pv9QFyPBMRteiRnJlq2P87gh9do1cltSRme2G9QoVJ9kyIS2hLQ7SP548LUIlGTi8XfhrQ' 'https://demo.thingsboard.io/api/user/7fd20980-ffac-11e9-9cef-cf7397cc2c36'



url = sprintf('https://demo.thingsboard.io/api/user/%s', id);
options = weboptions('RequestMethod','GET','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});

response = webread(url,options);

firstName = response.firstName;

lastName = response.lastName;

end