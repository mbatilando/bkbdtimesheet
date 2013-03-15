Feature: Testing Blackbaud Timesheet

	Background: 
		Given I open the timesheet app at "http://184.106.168.82/timesheets/" on Chrome
		And I input username "Derpina" and password "iheartkittens"

	Scenario:
		When I enter timeIn "8:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "6:00 p.m." for day "Monday"
		
