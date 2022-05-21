class House
  attr_reader :price,
              :address,
              :room
  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @room = []
  end
end
