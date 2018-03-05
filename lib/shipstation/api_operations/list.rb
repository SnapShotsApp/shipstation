module Shipstation
  module APIOperations
    module List
      def list(params = {})
        response = Shipstation.request(:get, class_name.downcase.pluralize, params)

        response
      end
    end
  end
end
