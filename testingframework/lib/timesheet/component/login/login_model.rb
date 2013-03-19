module Timesheet
  class UserLoginModel < Watirmark::Model::Factory
    keywords LoginView.keywords

    defaults do
      username {"atlas"}
      password {"genius"}
    end
  end


end