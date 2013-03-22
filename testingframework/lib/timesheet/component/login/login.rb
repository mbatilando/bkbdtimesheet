module Timesheet
  class Login < TSController
    @view = LoginView
    #@model = UserLoginModel
    #puts "this is my model in controller: #{@model.inspect}"
    alias :login :create

    def submit
      @view.loginButton.click
    end

  end
end