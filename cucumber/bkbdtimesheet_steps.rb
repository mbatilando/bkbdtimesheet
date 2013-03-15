require 'watir-webdriver'
require 'watir'
require 'watirmark/page/page'

Given /^I open the timesheet app at "([^"]*)" on Chrome/ do |url|
  @browser = Watir::Browser.new :chrome
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