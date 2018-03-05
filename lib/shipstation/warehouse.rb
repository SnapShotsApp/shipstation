module Shipstation
  class Warehouse < ApiResource
    extend Shipstation::Api::Create
    extend Shipstation::Api::Retrieve
    extend Shipstation::Api::Update
    class << self
      def list
        Shipstation.request(:get, 'warehouses')
      end
    end
  end
end
