Feature: Using the Blackbaud Login

  Scenario: Login using valid username and password
    Given I input username "macklemore" and password "thriftshop"


  Scenario: Automatic login using configuration from config.yml
    Given I login to the timesheet app

  Scenario: Using LoginModel to login
    Given I use a [new User Login: Oscar]