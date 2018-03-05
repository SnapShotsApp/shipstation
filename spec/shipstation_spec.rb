require 'spec_helper'

RSpec.describe Shipstation do
  let!(:version) { Shipstation::VERSION }
  let!(:singleton) { Shipstation::Client.instance }
  let!(:instance) { Shipstation::Client.new }

  it 'has a version number' do
    expect(version).not_to be nil
  end

  it 'can be accessed as a singleton' do
    expect(singleton).to_not be nil
  end

  it 'can be created as a new class' do
    expect(instance).to_not be nil
  end

  it 'can be assigned a username and password' do
    expect { instance.username = 'username' }.to_not raise_exception
    expect { instance.password = 'password' }.to_not raise_exception
    expect { singleton.username = 'username' }.to_not raise_exception
    expect { singleton.password = 'password' }.to_not raise_exception
  end
end
