Feature: Using the Blackbaud Timesheet Scheduler

  Background:
    Given I login to the timesheet app

  Scenario: Entering timesheet information for one day
    Given I enter timeIn "9:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "6:00 p.m." for day "Monday"

#	Scenario: Entering hours and submitting timesheet
#		When I enter timeIn "8:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "6:00 p.m." for day "Monday"
#		And I enter timeIn "9:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "5:00 p.m." for day "Tuesday"
#		And I enter timeIn "10:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "4:00 p.m." for day "Wednesday"
#		And I enter timeIn "11:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "3:00 p.m." for day "Thursday"
#		And I enter timeIn "12:00 p.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "2:00 p.m." for day "Friday"
#		And I enter timeIn "1:00 p.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "6:00 p.m." for day "Saturday"
#		And I enter timeIn "2:00 p.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "6:00 p.m." for day "Sunday"
#
#		When I enter manager "Cyrus Fakour"
#		And I enter intern name "John Doe"
#		And I enter email "johndoe@gmail.com"
#		And I enter date "11/10/1992"
#		And I submit timesheet
