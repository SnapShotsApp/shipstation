module Shipstation
  class Warehouse < ApiResource
    extend Shipstation::APIOperations::Create
    extend Shipstation::APIOperations::Retrieve
    extend Shipstation::APIOperations::Update

    class << self
        def list
          response = Shipstation.request(:get, 'warehouses')

          response
        end
    end
  end
end
