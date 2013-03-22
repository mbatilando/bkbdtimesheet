# Step definitions for the Blackbaud Timesheet app

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
  user = model.update({:username => username, :password => password})
  Login.new(user).login
end

When /^I enter timeIn "([^"]*)", lunchIn "([^"]*)", lunchOut "([^"]*)", and timeOut "([^"]*)" for day "([^"]*)"/ do |timeIn, lunchIn, lunchOut, timeOut, day|
  Scheduler.new().enterTime(day, timeIn, lunchIn, lunchOut, timeOut)
end

=begin
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