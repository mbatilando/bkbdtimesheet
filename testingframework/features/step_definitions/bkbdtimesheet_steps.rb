#require 'watir-webdriver'
#require 'watir'
#require 'watirmark/page/page'
#require_relative '../../lib/timeSheet_controller'

=begin
Given /^I open the timesheet app at "([^"]*)" on (firefox|chrome|ie)/ do |url, action|
  #@browser = Watir::Browser.new action.to_sym
  #@browser.goto(url)
#  @timesheet = TimeSheetController.new(url, browser)
  @timesheet = TimeSheetController.new url, action
end
=end

#Given /^I input username "([^"]*)" and password "([^"]*)"/ do |username, password|
#  @timesheet.login(username, password)
#end

#################

Given /^I input username "([^"]*)" and password "([^"]*)"/ do |username, password|
  Login.new({:username => username, :password => password}).login
end

Given /^I login to the timesheet app/ do
  Login.new({:username => "#{config.username}", :password => "#{config.password}"}).login
end

Given /^I use a (\[new User Login: \S+\])$/ do |model|
  Login.new(model).login
end

Given /^I use a (\[new User Login: \S+\]) with username "([^"]*)" and password "([^"]*)"/ do |model, username, password|
  # one-liner: Login.new(model.update({:username => username, :password => password})).login
  user = model.update({:username => username, :password => password})
  Login.new(user).login
  #user.update({:username => username, :password => password})
  #Login.user.login
end


=begin
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
=end