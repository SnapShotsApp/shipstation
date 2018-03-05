module Shipstation
  class Tag < ApiResource
    class << self
      def list
        Shipstation.request(:get, 'accounts/listtags')
      end
    end
  end
end
