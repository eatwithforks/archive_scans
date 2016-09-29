# encoding: utf-8
require_relative 'settings_controller'

# Returns argument for scans endpoint
class QueryFetcher
  def initialize
    @raw_params = Settings.params
  end

  def fetch
    customize(filter_whitelist_params)
  end

  def whitelist
    [:since, :until, :module]
  end

  def filter_whitelist_params
    @raw_params.select { |key, _| whitelist.include? key }
  end

  def customize(filtered)
    return if filtered.empty?
    result = ''
    filtered.each { |key, value| result += "#{key}=#{value}&" }
  end
end
