Feature: Test token authentication

  Scenario: Try to login without parameters
    Given I send a POST "/api/token-authentication" request
    Then the response status code should be 401

  Scenario: Try to login with wrong parameters
    Given I send a POST "/api/token-authentication" request with body:
    """
    {
      "username": "admin_api",
      "password": "fake"
    }
    """
    Then the response status code should be 401


  Scenario: Try to login with good parameters
    Given I send a POST "/api/token-authentication" request with body:
    """
    {
      "username": "admin_api",
      "password": "test"
    }
    """
    Then the response status code should be 200
