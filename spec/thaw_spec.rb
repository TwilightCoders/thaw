require "spec_helper"

describe Thaw do

  it 'thaws frozen objects' do
    string = "hello"
    string.freeze
    string.thaw
    expect(string).to_not be_frozen
  end

  it 'indicates thaw state' do
    expect(Thaw::VERSION).to_not be_thawed
  end

  it 'does not interfere with freezing objects' do
    string = "hello"
    string.freeze
    expect(string).to be_frozen
  end

end
