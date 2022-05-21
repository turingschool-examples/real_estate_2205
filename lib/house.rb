class House

  attr_reader :price, :address

  def initialize(price,address)
    @price = price[1..-1].to_i
    @address = address
  end

end
