module Shipstation
  class Tag < ApiResource
    class << self
        def list
          response = Shipstation.request(:get, 'accounts/listtags')

          response
        end
    end
  end
end
