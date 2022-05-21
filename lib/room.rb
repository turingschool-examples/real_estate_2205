class Room
  attr_reader :category, :length, :width
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @is_painted = false
  end

  def area
    @length * @width.to_i
  end

  def paint
    @is_painted = true
  end

  def is_painted?
    @is_painted
  end

end
