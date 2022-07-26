Feature: Create account with Data generator

# We are going to re-use a generate token feature.
Background: Prepare for test.generate token.
# Given url "https://tek-insurance-api.azurewebsites.net"
#	And path "/api/token"
#	And request {"username": "supervisor","password": "tek_supervisor"}
#	When method post
#	Then status 200
#	* def generatedToken = response.token
#	And print response
 	Given url "https://tek-insurance-api.azurewebsites.net"
	* def genTokenResult = callonce read('GenerateToken.feature') 
	And print genTokenResult
	* def generatedToken = genTokenResult.response.token
 	And print generatedToken
  And header Authorization = "Bearer " + generatedToken
  
Scenario: Create New Account using Data generator
	* def generator = Java.type('tiger.api.test.data.Datagenerator')	
	* def email = generator.getEmail()
	* def firstName = generator.getFirstName()
	* def lastName = generator.getLastName()
	* def dob = generator.getDob()
	And print email
	And print firstName
	And print lastName
	And print dob
	Given path "/api/accounts/add-primary-account"
	And request
	""" 
	{
	"email": "#(email)",
	"title": "Mr.",
	"firstName": "#(firstName)",
	"lastName": "#(lastName)",
	"gender": "MALE",
	"maritalStatus": "MARRIED",
	"employmentStatus": "Software Engineer",
	"dateOfBirth": "#(dob)"
	}
	"""
	
	When method post
	Then status 201
    * def generatedId = response.id
    And print generatedId
	And print response
	Then assert response.email == email
	