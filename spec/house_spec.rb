require './lib/room'
require './lib/house'

RSpec.describe House do

  before :each do
    @house = House.new("$400000", "123 sugar lane")


  end

  it 'exists' do

  expect(@house).to be_a(House)

  end
end
