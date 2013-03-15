require 'watir-webdriver'
require 'watir'
require 'watirmark/page/page'

Given /^I open the timesheet app at "([^"]*)" on (firefox|chrome|ie)/ do |url, action|
  @browser = Watir::Browser.new action.to_sym
  @browser.goto url
end

Given /^I input username "([^"]*)" and password "([^"]*)"/ do |username, password|
  @browser.text_field(:id, 'login-username').set(username)
  @browser.text_field(:id, 'login-password').set(password)
  @browser.button(:id, 'loginBut').click
end

When /^I enter timeIn "([^"]*)", lunchIn "([^"]*)", lunchOut "([^"]*)", and timeOut "([^"]*)" for day "([^"]*)"/ do |timeIn, lunchIn, lunchOut, timeOut, day|
  @browser.select_list(:id, day+"TimeIn").when_present.select(timeIn)
  @browser.select_list(:id, day+"LunchIn").select(lunchIn)
  @browser.select_list(:id, day+"LunchOut").select(lunchOut)
  @browser.select_list(:id, day+"TimeOut").select(timeOut)
end

When /^I enter manager "([^"]*)"/ do |manager|
  @browser.select_list(:id, "manager").when_present.select(manager)
end

When /^I enter intern name "([^"]*)"/ do |internName|
  @browser.text_field(:id, "intern_name").when_present.set(internName)
end

When /^I enter email "([^"]*)"/ do |email|
  @browser.text_field(:id, "cc").when_present.set(email)
end

When /^I enter date "([^"]*)"/ do |date|
  @browser.text_field(:id, "datepicker").when_present.set(date)
end

When /^I submit timesheet/ do
  @browser.button(:name, 'submitBut2').click
  @browser.button(:name, 'modalConfirm').click
end