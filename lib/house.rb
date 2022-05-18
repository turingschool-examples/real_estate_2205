class House
  attr_reader :price, :address

  def initialize(price, address)
    @price = price.to_i
    @address = address
  end

end
