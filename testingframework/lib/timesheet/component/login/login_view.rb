module Timesheet
  class LoginView < TSView
    keyword(:username)	      {browser.text_field(:id, 'login-username')}
    keyword(:password)        {browser.text_field(:id, 'login-password')}
    keyword(:rememberMe)	    {browser.checkbox(:id, 'rememberMe')}
    keyword(:loginButton)		  {browser.button(:id, 'loginBut')}

    def create(model)
      #puts model.inspect
      #model.username = "#{config.username}"
      #print "This is the default username: " + model.username
      #model.password = "#{config.password}"
      #print "This is the default password: " + model.password
      browser.goto "#{config.url}"
      puts "this is my model in view: #{model}"
    end

  end
end