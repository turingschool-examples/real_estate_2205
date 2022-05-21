require './lib/room'
require './lib/house'
require 'pry'

RSpec.describe House do
  let(:house) {House.new("$400000", "123 sugar lane")}

  it "exists and has attributes" do
    expect(house.price).to eq 400000
    expect(house.address).to eq "123 sugar lane"
    expect(house.room).to eq []
  end
end
