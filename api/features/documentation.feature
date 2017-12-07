Feature: Documentation

  Scenario: Display the documentation
    Given I send a GET "/documentation" request
    Then the response status code should be 200
