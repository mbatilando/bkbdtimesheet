module Timesheet
  class Scheduler < TSController
	@view = SchedulerView

    def enterTime(day, timeIn, lunchIn, lunchOut, timeOut)
      timeInSym = day + "TimeIn"
      timeInSym = timeInSym.to_sym
      lunchInSym = day + "LunchIn"
      lunchInSym = lunchInSym.to_sym
      lunchOutSym = day + "LunchOut"
      lunchOutSym = lunchOutSym.to_sym
      timeOutSym = day + "TimeOut"
      timeOutSym = timeOutSym.to_sym

      @view.MondayTimeIn.when_present.set(timeIn)
      @view.MondayLunchIn.set(lunchIn)
      @view.MondayLunchOut.set(lunchOut)
      @view.MondayTimeOut.set(timeOut)

      @view.TuesdayTimeIn.set(timeIn)
      @view.TuesdayLunchIn.set(lunchIn)
      @view.TuesdayLunchOut.set(lunchOut)
      @view.TuesdayTimeOut.set(timeOut)
    end

    def selectManager(manager)
    end

    def enterInternName(internName)
    end

    def enterEmail(email)
    end

    def enterDate(date)
    end


  #def submit
  #  @view.submitButton.click
  #end

  end
end