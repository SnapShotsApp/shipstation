require 'active_support/all'
require 'rest-client'

require 'shipstation/params_helper'
require 'shipstation/endpoints'
require 'shipstation/request'

module Shipstation
  class Client
    include Shipstation::ParamsHelper
    include Shipstation::Request
    include Shipstation::Endpoints

    class ShipstationError < StandardError; end
    class AuthenticationError < ShipstationError; end
    class ConfigurationError < ShipstationError; end

    def self.instance
      @@instance ||= new
    end

    attr_writer :username
    attr_writer :password

    def initialize(username = nil, password = nil)
      @username = username
      @password = password
    end

    def username
      raise raise(ConfigurationError, 'Shipstation username not configured') unless @username.present?
      @username
    end

    def password
      raise raise(ConfigurationError, 'Shipstation password not configured') unless @password.present?
      @password
    end

    def auth
      { username: username, password: password }
    end
  end
end
