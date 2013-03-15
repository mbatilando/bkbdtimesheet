require 'watir-webdriver'
require 'watir'
require 'watirmark/page/page'

Given /^I open the timesheet app at "([^"]*)" on Chrome/ do |url|
  @browser = Watir::Browser.new :chrome
  @browser.goto url
end

Given /^I input username "([^"]*)" and password "([^"]*)"/ do |username, password|
  puts "hey yo"
  @browser.text_field(:id, 'login-username').set(username)
  @browser.text_field(:id, 'login-password').set(password)
  @browser.button(:id, 'loginBut').click
end

