module Timesheet
  class Scheduler
	@view = SchedulerView
	
    def submit
      @view.submitButton.click
    end
  end
end