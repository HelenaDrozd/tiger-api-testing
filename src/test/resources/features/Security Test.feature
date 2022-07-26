@Smoke
Feature: Security test. Token Generation test

@Security
Scenario: generate token with valid username and password.
	Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "supervisor","password": "tek_supervisor"}
	When method post
	Then status 200
	And print response
	
	#2) Test API Endpoint "/api/token" with invalid username and valid password.
	# Status code should be 404 not found. and print the response.
	# and response errorMessage is "USER_NOT_FOUND"
	
	@negative
	Scenario: generate token with invalid username and password.
	Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "supervisor1","password": "tek_supervisor"}
	When method post
	Then status 404
	And print response
	* def errorMessage = response.errorMessage
	And assert errorMessage == "USER_NOT_FOUND"
	
	#3) Test API Endpoint "/api/token" with valid username and invalid password.
	# Status code should be 400.
	# Response with "errorMessage" : "Password Not Matched". Take screen shot and share.
	# NOTE: there is a defect for this scenario already open.
	
	@negative
	Scenario: generate token with valid username and invalid password.
	Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "supervisor","password": "tek_supervisor1"}
	When method post
	Then status 400
	And print response
	* def errorMessage = response.errorMessage
	And assert errorMessage == "Password Not Matched"

	  
	
	
	
	
	
	
	