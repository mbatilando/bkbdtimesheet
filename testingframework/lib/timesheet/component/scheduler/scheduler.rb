module Timesheet
  class Scheduler
	@view = SchedulerView
	
    def submit
      @view.submitButton.click
    end

    def enterTime()
    end

    def selectManager(manager)
    end

    def enterInternName(internName)
    end

    def enterEmail(email)
    end

    def enterDate(date)
    end
  end
end