function response= deleteUserById(id,token)


%curl -X DELETE --header 'Accept: */*' --header 'X-Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoYWFtYWF0eWFAZ21haWwuY29tIiwic2NvcGVzIjpbIlRFTkFOVF9BRE1JTiJdLCJ1c2VySWQiOiJiMzUyYTA0MC02ZjBmLTExZTktYmJmNi1iMWY5OWVlOWY3NDkiLCJmaXJzdE5hbWUiOiJFYnJhIiwibGFzdE5hbWUiOiJBdHlhIiwiZW5hYmxlZCI6dHJ1ZSwicHJpdmFjeVBvbGljeUFjY2VwdGVkIjp0cnVlLCJpc1B1YmxpYyI6ZmFsc2UsInRlbmFudElkIjoiYjMyOGQxMjAtNmYwZi0xMWU5LWJiZjYtYjFmOTllZTlmNzQ5IiwiY3VzdG9tZXJJZCI6IjEzODE0MDAwLTFkZDItMTFiMi04MDgwLTgwODA4MDgwODA4MCIsImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNTczODA4NzAyLCJleHAiOjE1NzU2MDg3MDJ9.Jx4O5Be26wEUuHr9Pv9QFyPBMRteiRnJlq2P87gh9do1cltSRme2G9QoVJ9kyIS2hLQ7SP548LUIlGTi8XfhrQ' 'https://demo.thingsboard.io/api/user/851eea30-ffb5-11e9-ad54-7f438c0cbd6e'

url = sprintf('https://demo.thingsboard.io/api/user/%s',id)

options = weboptions('RequestMethod','DELETE','HeaderFields',{'Accept' '*/*';'X-Authorization' token});

response = webread(url,options);




end

