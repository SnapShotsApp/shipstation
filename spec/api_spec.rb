require 'spec_helper'

RSpec.describe Shipstation::Api do
  let!(:before_params) {
    {
        first_param: true,
        HashParam: {
          'nested_Value': true
        }
    }
  }
  let!(:after_params) {
    {
        firstParam: true,
        hashParam: {
          nestedValue: true
        }
    }
  }
  let!(:class_conforming) { Class.new { extend Shipstation::Api } }

  it "should format params correctly" do
    result = class_conforming.format_params(before_params)
    expect(result).to eq(after_params)
  end
end
