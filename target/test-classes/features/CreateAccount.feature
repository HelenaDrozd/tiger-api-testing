Feature: Create Account

# 5) Test API endpoint "api/accounts/add-primary-account" to add new Account (same as we do fill the form in UI)'
# Then status code should be 201 - CREATED, WITH RESPONSE GENERATE ACCOUNT WITH eMAIL ADDRESS.

Background: generate token for all scenarios.
 	Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "supervisor","password": "tek_supervisor"}
	When method post
	Then status 200
	* def generatedToken = response.token

Scenario: Create new Account happy path
 	Given path "/api/accounts/add-primary-account"
	And request {"id": 0,"email": "mishashuh@gmail.com","title": "Mr.","firstName": "Misha","lastName": "Shuhernoj","gender": "MALE","maritalStatus": "MARRIED","employmentStatus": "Software Engineer","dateOfBirth": "1977-07-17"}
	And header Authorization = "Bearer " + generatedToken
	When method post
	Then status 201
	And print response
	
	# 2) Test API endpoint "api/accounts/add-primary-account" to add new Account with Existing email address.
	# Then status code should be 400 - Bad Request, validate response
	
		# 3) Test API endpoint "/api/accounts/add-account-car" to add car to existing account.
		# Then status code should be 201 - Create, validate response
		
		# 4) Test API endpoint "/api/accounts/add-account-phone" to add phone # to existing account.
		# Then status code should be 201 - Create, validate response
	
		# 5) Test API endpoint "/api/accounts/add-account-address" to add address to existing account.
		# Then status code should be 201 - Create, validate response
	
 