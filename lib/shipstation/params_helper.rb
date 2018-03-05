module Shipstation::ParamsHelper
  extend ActiveSupport::Concern
  included do
    def toCamel(value)
      case value
      when Array
        value.map { |v| format_params(v) }
      when Hash
        Hash[value.map { |k, v| [k.to_s.camelize(:lower).to_sym, format_params(v)] }]
      else
        value
      end
    end

    def toUnderscore(value)
      case value
      when Array
        value.map { |v| format_params(v) }
      when Hash
        Hash[value.map { |k, v| [k.to_s.underscore.to_sym, format_params(v)] }]
      else
        value
      end
    end
  end
end
