
module TIMESHEET

  require 'watir-webdriver'
  require 'watir'
  require 'watirmark/page/page'

  class TimeSheetController < Watirmark::WebPage::Controller

    def login(username, password)
      @browser.text_field(:id, 'login-username').set(username)
      @browser.text_field(:id, 'login-password').set(password)
      @browser.button(:id, 'loginBut').click
    end

    def enterTime(timeIn, lunchIn, lunchOut, timeOut, day)
      @browser.select_list(:id, day+"TimeIn").when_present.select(timeIn)
      @browser.select_list(:id, day+"LunchIn").select(lunchIn)
      @browser.select_list(:id, day+"LunchOut").select(lunchOut)
      @browser.select_list(:id, day+"TimeOut").select(timeOut)
    end

    def selectManager(manager)
      @browser.select_list(:id, "manager").when_present.select(manager)
    end

    def enterInternName(internName)
      @browser.text_field(:id, "intern_name").when_present.set(internName)
    end

    def enterEmail(email)
      @browser.text_field(:id, "cc").when_present.set(email)
    end

    def enterDate(date)
      @browser.text_field(:id, "datepicker").when_present.set(date)
    end

    def submitTimesheet()
      @web.link(:name => 'submitBut2').click
      @Watir::Wait.until{web.link(:name => 'modalConfirm').exists?}
      @Watir::Wait.until{web.link(:name => 'modalConfirm').visible?}
      @web.link(:name => 'modalConfirm').click
    end

  end

end
