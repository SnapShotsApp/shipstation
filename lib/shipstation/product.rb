module Shipstation
  class Product < ApiResource
    extend Shipstation::Api::List
    extend Shipstation::Api::Retrieve
    extend Shipstation::Api::Update
  end
end
