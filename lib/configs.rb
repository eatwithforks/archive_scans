# encoding: utf-8
require 'yaml'

# Returns preset configs
class Config
  class << self
    def [](key)
      load unless @configs
      @configs[key]
    end

    def load
      return @configs if @configs

      @configs = env_config.merge(en_config)
    end

    def env_config
      configs = File.expand_path("../../configs/portal.yml", __FILE__)

      raise LoadError.new "#{configs} is missing." unless FileTest.exists?(configs)
      YAML.load(File.read(configs))
    end

    def en_config
      en_file = File.expand_path('../../configs/en.yml', __FILE__)

      raise LoadError.new "#{en_file} configuration file is missing." unless FileTest.exists?(en_file)
      YAML.load(File.read(en_file))
    end
  end
end
