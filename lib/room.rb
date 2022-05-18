class Room
  attr_reader :category, :length, :width, :painted

  def initialize(category, length, width)
    @category = category
    @length = length.to_i
    @width = width.to_i
    @painted = false
  end

  def area
    area = @length * @width
  end

  def is_painted?
    return true if @painted
    return false
  end

  def paint
    @painted = true
  end

end
