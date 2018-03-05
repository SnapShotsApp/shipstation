module Shipstation
  class Store < ApiResource
    extend Shipstation::Api::Retrieve
    extend Shipstation::Api::Update
    class << self
      def list
        Shipstation.request(:get, 'stores')
      end
    end
  end
end
