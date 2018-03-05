module Shipstation::Request
  extend ActiveSupport::Concern
  included do
    API_BASE = 'https://ssapi.shipstation.com/'.freeze

    def request(method, resource, params = {})
      ss_username = auth[:username]
      ss_password = auth[:password]

      params.except!(:username, :password)

      defined? method || raise(
        ArgumentError, 'Request method has not been specified'
      )
      defined? resource || raise(
        ArgumentError, 'Request resource has not been specified'
      )
      if method == :get
        headers = { accept: :json, content_type: :json }.merge(params: params)
        payload = nil
      else
        headers = { accept: :json, content_type: :json }
        payload = params
      end
      RestClient::Request.new(
        method: method,
        url: API_BASE + resource,
        user: ss_username,
        password: ss_password,
        payload: payload ? payload.to_json : nil,
        headers: headers
      ).execute do |response, _request, _result|
        str_response = response.to_str
        str_response.blank? ? '' : JSON.parse(str_response)
      end
    end
  end
end
