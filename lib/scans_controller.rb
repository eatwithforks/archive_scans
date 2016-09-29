require 'cloudpassage'
require 'json'
require_relative 'configs'
require_relative 'query_fetcher'
require_relative 'validator'

class ScansController
  def initialize
    @api = Api.new(Config['key_id'], Config['secret_key'], Config['api_hostname'])
  end

  def index
    resp = @api.get("v1/scans?#{Query.fetch}")
    Validate.response(resp, 200)

    data = JSON.parse(resp)
    Validate.has_content(data)

    data
  end
end
