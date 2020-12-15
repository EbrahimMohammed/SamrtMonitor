function dashboards = getDashboards(token)
%curl -X GET --header 'Accept: application/json' --header 'X-Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoYWFtYWF0eWFAZ21haWwuY29tIiwic2NvcGVzIjpbIlRFTkFOVF9BRE1JTiJdLCJ1c2VySWQiOiJiMzUyYTA0MC02ZjBmLTExZTktYmJmNi1iMWY5OWVlOWY3NDkiLCJmaXJzdE5hbWUiOiJFYnJhIiwibGFzdE5hbWUiOiJBdHlhIiwiZW5hYmxlZCI6dHJ1ZSwicHJpdmFjeVBvbGljeUFjY2VwdGVkIjp0cnVlLCJpc1B1YmxpYyI6ZmFsc2UsInRlbmFudElkIjoiYjMyOGQxMjAtNmYwZi0xMWU5LWJiZjYtYjFmOTllZTlmNzQ5IiwiY3VzdG9tZXJJZCI6IjEzODE0MDAwLTFkZDItMTFiMi04MDgwLTgwODA4MDgwODA4MCIsImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNTc1NjE3ODM0LCJleHAiOjE1Nzc0MTc4MzR9.5rUQF_NBsK2N0vnWae8lYoVDWH8W5YueV-JQas9UguJ3g8zdj__9bOVhiqvqUOZY4NxuEoyLX7ZO1PQ6y_3LrA' 'https://demo.thingsboard.io/api/tenant/dashboards?limit=5'
url = sprintf('https://demo.thingsboard.io/api/tenant/dashboards?limit=15');
%token = getToken();
options = weboptions('RequestMethod','GET','HeaderFields',{'Accept' 'application/json';'X-Authorization' token});
response = webread(url, options);

try
dashboards = extractfield(response.data, 'title');
catch
end

