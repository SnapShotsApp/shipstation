module Shipstation
  class ApiResource
    def self.class_name
      name.split('::')[-1]
    end
  end
end
