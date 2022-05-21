require './lib/room'
require './lib/house'

RSpec.describe House do
  it "house exist" do
    house = House.new("$400000", "123 sugar lane")
    expect(house).to be_a(House)
  end
