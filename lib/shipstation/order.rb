module Shipstation
  class Order < ApiResource
    extend Shipstation::Api::List
    extend Shipstation::Api::Create
    extend Shipstation::Api::Retrieve
    class << self
      def create_label(params = {})
        Shipstation.request(:post, 'orders/createlabelfororder', params)
      end

      def assign_tag(params = {})
        Shipstation.request(:post, 'orders/addtag', params)
      end
    end
  end
end
