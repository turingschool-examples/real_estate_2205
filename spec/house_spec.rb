require './lib/house'

RSpec.describe House do
  let(:house) { House.new("$400000", "123 sugar lane") }

  it "exists" do
    expect(house).to be_a(House)
  end

  it "has attributes" do
    expect(house.price).to eq(400000)
    expect(house.address).to eq("123 sugar lane")
    expect(house.rooms).to eq([])
  end

end
