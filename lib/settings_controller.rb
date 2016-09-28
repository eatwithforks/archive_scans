# encoding: utf-8
require 'optparse'
require_relative 'configs'

class Settings
  class << self
    def params
      options = {}
      OptionParser.new do |opts|
        opts.on('--auth ARG', Config['help']['auth']) { |auth| options[:auth] = auth }
        opts.on('--starting ARG', Config['help']['starting']) { |since| options[:since] = since }
        opts.on('--ending ARG', Config['help']['ending']) { |ending| options[:until] = ending }
        opts.on('--base ARG', Config['help']['base']) { |base_url| options[:base] = base_url }
        opts.on('--localca', Config['help']['localca']) { |bool| options[:localca] = bool }
        opts.on('--detailsfiles', Config['help']['detailsfiles']) { |bool| options[:detailsfiles] = bool }
        opts.on('--threads ARG', Config['help']['threads']) { |count| options[:threads] = count }
        opts.on_tail('--help', 'Show this message') do
          puts opts
          exit
        end
      end.parse!

      options
    end
  end
end
