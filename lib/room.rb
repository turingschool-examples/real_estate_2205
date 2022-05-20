class Room

  attr_reader :category, :width, :length, :painted
  def initialize(category, width, length)
    @category = category
    @width = width
    @length = length
    @painted = false
  end

  def area
    @width * @length.to_i
  end

  def is_painted?
    @painted
  end

  def paint
    @painted = true
  end

end
