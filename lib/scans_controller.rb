require 'cloudpassage'
require_relative 'configs'

class ScansController
  def initialize
    @api = Api.new(Config['key_id'], Config['secret_key'], Config['api_hostname'])
  end

  def get
    resp = @api.get('v1/scans')
  end
end
