Feature: Using the Blackbaud Timesheet Login

  Scenario: Login using valid username and password
    Given I input username "macklemore" and password "thriftshop"

  Scenario: Automatic login using configuration from config.yml
    Given I login to the timesheet app

  Scenario: Using LoginModel with default username and password to login
    Given I use a [new User Login: Oscar]

  Scenario: Using LoginModel using valid username and password to login
    Given I use a [new User Login: Oscar] with username "twodoorcinemaclub" and password "whatyouknow"