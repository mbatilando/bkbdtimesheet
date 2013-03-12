require 'watir-webdriver'
require 'watir'
require_relative 'timeSheet_view.rb'

web = Watir::Browser.new :chrome
web.goto 'http://184.106.168.82/timesheets/'

puts "hey yo"

#view.login("macklemore", "thriftshop")

#web.(view.loginUsername).set 'macklemore'
web.text_field(:id => 'login-username').set('macklemore')
web.text_field(:id => 'login-password').set('thriftshop')
web.button(:id => 'loginBut').click

web.select_list(:id => "MondayTimeIn").when_present.select('9:00 a.m.')
web.select_list(:id => "MondayTimeOut").select('5:00 p.m.')
web.select_list(:id => "TuesdayLunchIn").select('12:00 p.m.')
web.select_list(:id => "TuesdayLunchOut").select('12:30 p.m.')
web.select_list(:id => "TuesdayTimeOut").select('5:00 p.m.')
# web.select_list(:id => "manager").select('Cyrus Fakour')  Doesn't seem to work
# web.text_field(:id => "intern_name").set('mackle more')   Doesn't seem to work
# web.text_field(:id => "cc").set('oscar.bachtiar@blackbaud.com')   Doesn't seem to work
web.text_field(:id => "datepicker").when_present.set('03/21/2013')