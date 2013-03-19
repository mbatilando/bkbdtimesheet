=begin
require 'watir-webdriver'
require 'watir'
require 'watirmark/page/page'
require '../step_definitions/bkbdtimesheet_steps'
require '../../testingFramework/lib/timeSheet_controller'
require '../../testingFramework/lib/timeSheet_view'
=end
#require_relative '../../lib/timesheet.rb'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'timesheet'
include Timesheet