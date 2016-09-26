# encoding: utf-8
require 'optparse'
require_relative 'configs'

class Settings
  class << self
    def params
      options = {}
      OptionParser.new do |opts|
        opts.on('-s', '--starting ARG', Config['help']['starting']) do |starting|
          options[:since] = starting
        end

        opts.on('-e', '--ending ARG', Config['help']['ending']) do |ending|
          options[:until] = ending
        end

        opts.on('-l', '--localca', Config['help']['localca']) do |ca_path|
          options[:localca] = ca_path
        end

        opts.on('-d', '--detailsfiles', Config['help']['detailsfiles']) do |debug|
          options[:detailsfiles] = debug
        end

        opts.on('-t', '--threads ARG', Config['help']['threads']) do |threads|
          options[:threads] = threads
        end
      end.parse!

      options
    end
  end
end
