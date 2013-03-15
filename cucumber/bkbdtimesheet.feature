Feature: Testing Blackbaud Timesheet

	Background: 
		Given I open the timesheet app at "http://184.106.168.82/timesheets/" on Chrome
		And I input username "Derpina" and password "iheartkittens"

	Scenario:
		When I enter timeIn "8:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "6:00 p.m." for day "Monday"
		And I enter timeIn "9:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "5:00 p.m." for day "Tuesday"
		And I enter timeIn "10:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "4:00 p.m." for day "Wednesday"
		And I enter timeIn "11:00 a.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "3:00 p.m." for day "Thursday"
		And I enter timeIn "12:00 p.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "2:00 p.m." for day "Friday"
		And I enter timeIn "1:00 p.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "6:00 p.m." for day "Saturday"
		And I enter timeIn "2:00 p.m.", lunchIn "11:00 a.m.", lunchOut "12:00 p.m.", and timeOut "6:00 p.m." for day "Sunday"	

		When I enter manager "Cyrus Fakour"
		When I enter intern name "John Doe"
		When I enter email "johndoe@gmail.com"
		When I enter date "11/10/1992"
		When I submit timesheet
