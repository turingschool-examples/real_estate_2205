class Room

  attr_reader :category, :width, :length
  def initialize(category, width, length)
    @category = category
    @width = width
    @length = length
  end

  def area
    @width * @length.to_i
  end

end
