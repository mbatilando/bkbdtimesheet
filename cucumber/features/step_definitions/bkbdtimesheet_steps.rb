#require 'watir-webdriver'
#require 'watir'
#require 'watirmark/page/page'
require_relative '../../lib/timeSheet_controller'

Given /^I open the timesheet app at "([^"]*)" on (firefox|chrome|ie)/ do |url, action|
  #@browser = Watir::Browser.new action.to_sym
  #@browser.goto(url)
  @timesheet = TimeSheetController.new
end

Given /^I input username "([^"]*)" and password "([^"]*)"/ do |username, password|
  @timesheet.login(username, password)
end

When /^I enter timeIn "([^"]*)", lunchIn "([^"]*)", lunchOut "([^"]*)", and timeOut "([^"]*)" for day "([^"]*)"/ do |timeIn, lunchIn, lunchOut, timeOut, day|
  @timesheet.enterTime(timeIn, lunchIn, lunchOut, timeOut, day)
end

When /^I enter manager "([^"]*)"/ do |manager|
  @timesheet.selectManager(manager)
end

When /^I enter intern name "([^"]*)"/ do |internName|
  @timesheet.enterInternName(internName)
end

When /^I enter email "([^"]*)"/ do |email|
  @timesheet.enterEmail(email)
end

When /^I enter date "([^"]*)"/ do |date|
  @timesheet.enterDate(date)
end

When /^I submit timesheet/ do
  @timesheet.submitTimesheet()
end