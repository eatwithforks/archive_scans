# encoding: utf-8
require_relative 'lib/scans_controller'
require_relative 'lib/settings_controller'
require_relative 'lib/query_fetcher'
require_relative 'lib/configs'
require 'pp'

pp ScansController.new.index