class Room
  attr_reader :category, :length, :width

  def initialize(category, length, width)
    @category = category
    @length = length.to_i
    @width = width.to_i
  end

  def area
    area = @length * @width
  end

end
