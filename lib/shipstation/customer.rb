module Shipstation
  class Customer < ApiResource
    extend Shipstation::Api::List
    extend Shipstation::Api::Retrieve
  end
end
