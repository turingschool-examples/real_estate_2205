class Room
  attr_reader :category, :length, :width, :room, :painted
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width.to_i
    @room = room
    @painted = false
  end

  def area
    length * width
  end

  def is_painted?
    @painted
  end

  def paint
    @painted = true
  end

end
