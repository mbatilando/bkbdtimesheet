module Timesheet
  class SchedulerView < TSView

    #manager, intern info, and date fields
    keyword(:managerName)	{browser.select_list(:name, 'manager')}
    keyword(:internName)	{browser.text_field(:name, 'intern_name')}
    keyword(:internEmail)	{browser.text_field(:name, 'cc')}
    keyword(:date)			{browser.text_field(:name, 'weekof')}

    #TimeIn, LunchIn, LunchOut, TimeOut for all days of the week
    days =["Monday", "Tuesday","Wednesday", "Thursday", "Friday", "Saturday" ,"Sunday"]

    #for day in days
    #  timeIn = day + "TimeIn"
    #  keyword(timeIn.to_sym)		{browser.select_list(:name, timeIn)}
    #  lunchIn = day + "LunchIn"
    #  keyword(lunchIn.to_sym)		{browser.select_list(:name, lunchIn)}
    #  lunchOut = day + "LunchOut"
    #  keyword(lunchOut.to_sym)	{browser.select_list(:name, lunchOut)}
    #  timeOut = day + "TimeOut"
    #  keyword(timeOut.to_sym)		{browser.select_list(:name, timeOut)}
    #end

    keyword(:MondayTimeIn) {browser.select_list(:name, "MondayTimeIn")}
    keyword(:MondayLunchIn) {browser.select_list(:name, "MondayLunchIn")}
    keyword(:MondayLunchOut) {browser.select_list(:name, "MondayLunchOut")}
    keyword(:MondayTimeOut) {browser.select_list(:name, "MondayTimeOut")}

    keyword(:TuesdayTimeIn) {browser.select_list(:name, "TuesdayTimeIn")}
    keyword(:TuesdayLunchIn) {browser.select_list(:name, "TuesdayLunchIn")}
    keyword(:TuesdayLunchOut) {browser.select_list(:name, "TuesdayLunchOut")}
    keyword(:TuesdayTimeOut) {browser.select_list(:name, "TuesdayTimeOut")}

    keyword(:WednesdayTimeIn) {browser.select_list(:name, "WednesdayTimeIn")}
    keyword(:WednesdayLunchIn) {browser.select_list(:name, "WednesdayLunchIn")}
    keyword(:WednesdayLunchOut) {browser.select_list(:name, "WednesdayLunchOut")}
    keyword(:WednesdayTimeOut) {browser.select_list(:name, "WednesdayTimeOut")}

    keyword(:ThursdayTimeIn) {browser.select_list(:name, "ThursdayTimeIn")}
    keyword(:ThursdayLunchIn) {browser.select_list(:name, "ThursdayLunchIn")}
    keyword(:ThursdayLunchOut) {browser.select_list(:name, "ThursdayLunchOut")}
    keyword(:ThursdayTimeOut) {browser.select_list(:name, "ThursdayTimeOut")}

    keyword(:FridayTimeIn) {browser.select_list(:name, "FridayTimeIn")}
    keyword(:FridayLunchIn) {browser.select_list(:name, "FridayLunchIn")}
    keyword(:FridayLunchOut) {browser.select_list(:name, "FridayLunchOut")}
    keyword(:FridayTimeOut) {browser.select_list(:name, "FridayTimeOut")}

    keyword(:SaturdayTimeIn) {browser.select_list(:name, "SaturdayTimeIn")}
    keyword(:SaturdayLunchIn) {browser.select_list(:name, "SaturdayLunchIn")}
    keyword(:SaturdayLunchOut) {browser.select_list(:name, "SaturdayLunchOut")}
    keyword(:SaturdayTimeOut) {browser.select_list(:name, "SaturdayTimeOut")}

    keyword(:SundayTimeIn) {browser.select_list(:name, "SundayTimeIn")}
    keyword(:SundayLunchIn) {browser.select_list(:name, "SundayLunchIn")}
    keyword(:SundayLunchOut) {browser.select_list(:name, "SundayLunchOut")}
    keyword(:SundayTimeOut) {browser.select_list(:name, "SundayTimeOut")}

    #Total time per day. ***Can we include this in the for loop above?
    keyword(:MondayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 5).text}
    keyword(:TuesdayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 11).text}
    keyword(:WednesdayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 17).text}
    keyword(:ThursdayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 23).text}
    keyword(:FridayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 29).text}
    keyword(:SaturdayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 35).text}
    keyword(:SundayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 41).text}
    keyword(:WeekTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 46).text}

    #Submission buttons
    keyword(:submitButton) {browser.button(:name, 'submitBut2')}
    keyword(:submitConfirm) {browser.button(:name, 'modalConfirm')}
    keyword(:submitNegate) {browser.button(:name, 'cancelSub')}

  end
end