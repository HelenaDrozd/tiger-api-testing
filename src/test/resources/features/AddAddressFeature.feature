Feature: Create an accountand add address to the account.

  # Step 1) Get a token
  # Step 2) Generate an Account
  # Step 3) add address to the gnerated account.
  Background: Create new Account.
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createAccountResult = callonce read('CreateAccountFeature.feature')
    And print createAccountResult
#    * def primaryPersonId = createAccountResult.response.id
    * def primaryPersonId = createAccountResult.generatedId
    * def token = createAccountResult.genTokenResult.response.token
    And print primaryPersonId
   And header Authorization = "Bearer " + token

  Scenario: Add address to an account
    Given path '/api/accounts/add-account-address'
    Given param primaryPersonId = primaryPersonId
#    Given header Authorization = "Bearer " + token
    Given request
      """
      {
       "addressType": "Home",
       "addressLine1": "1234 Tysons Central St",
       "city": "Vienna",
       "state": "Virginia",
       "postalCode": "22182",
       "countryCode": "+1",
       "current": true
      }
      """
    When method post
    Then status 201
    And print response
