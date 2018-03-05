module Shipstation
  class Carrier < ApiResource
    class << self
      def list
        Shipstation.request(:get, 'carriers')
      end
    end
  end
end
