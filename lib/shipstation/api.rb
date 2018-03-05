module Shipstation
  module Api
    def format_params(value)
      case value
        when Array
          value.map { |v| format_params(v) }
        when Hash
          Hash[value.map { |k, v| [k.to_s.camelize(:lower).to_sym, format_params(v)] }]
        else
          value
      end
    end

    module Create
      def create(params = {})
        Shipstation.request(:post, "#{class_name.downcase.pluralize}/create#{class_name.downcase}", format_params(params))
      end
    end

    module List
      def list(params = {})
        Shipstation.request(:get, class_name.downcase.pluralize, format_params(params))
      end
    end

    module Retrieve
      def retrieve(object_id, params = {})
        Shipstation.request(:get, "#{class_name.downcase.pluralize}/#{object_id}", format_params(params))
      end
    end

    module Update
      def update(object_id, params = {})
        Shipstation.request(:put, "#{class_name.downcase.pluralize}/#{object_id}", format_params(params))
      end
    end
  end
end
