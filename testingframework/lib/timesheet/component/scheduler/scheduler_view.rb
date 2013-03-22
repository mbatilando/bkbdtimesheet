module Timesheet
  class SchedulerView

    #manager, intern info, and date fields
    keyword(:managerName)	{browser.select_list(:name, 'manager')}
    keyword(:internName)	{browser.text_field(:name, 'intern_name')}
    keyword(:internEmail)	{browser.text_field(:name, 'cc')}
    keyword(:date)			{browser.text_field(:name, 'weekof')}

    #TimeIn, LunchIn, LunchOut, TimeOut for all days of the week
    days =["Monday", "Tuesday","Wednesday", "Thursday", "Friday", "Saturday" ,"Sunday"]

    for day in days
      timeIn = day + "TimeIn"
      keyword(timeIn.to_sym)		{browser.select_list(:name, timeIn)}
      lunchIn = day + "LunchIn"
      keyword(lunchIn.to_sym)		{browser.select_list(:name. lunchIn)}
      lunchOut = day + "LunchOut"
      keyword(lunchOut.to_sym)	{browser.select_list(:name, lunchOut)}
      timeOut = day + "TimeOut"
      keyword(timeOut.to_sym)		{browser.select_list(:name, timeOut)}
    end

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