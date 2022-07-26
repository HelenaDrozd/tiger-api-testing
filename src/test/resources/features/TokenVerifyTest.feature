# Generate a valid token and verify it with below requirement.
# test api endpoint "api/token/verify" with valid token.
# Sattus should be 200 -   

Feature: Security test. Verify Token test.

Scenario: generate token with valid username and password.
	Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "supervisor","password": "tek_supervisor"}
	When method post
	Then status 200
	* def generatedToken = response.token
	Given path "api/token/verify"
	And param username = "supervisor"
	And param token = generatedToken
	When method get
	Then status 200
	And print response
	
	# 3) test endpoint "api/token/verify" with invalid token.
	# Note: since it's invalid token it can be any random string. You don't need to generate a new token
	# Status should be 400 - bad request and response should be TOKEN_EXPIRED
	# there is a defect open for this scenario already.
	
Scenario: generate token with valid username and password.
	Given url "https://tek-insurance-api.azurewebsites.net"
	* def generatedToken = "jhgjhgjhgjlk"
	Given path "api/token/verify"
	And param username = "supervisor"
	And param token = generatedToken
	When method get
	Then status 400
	And print response
	* def errorMessage = response.errorMessage
	And assert errorMessage == "Token Expired or Invalid Token"  

