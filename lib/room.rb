class Room

  attr_reader :category, :length, :width

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint = false
  end

  def area
    @length *= @width.to_i
  end

  def paint
    @paint == true
  end

  def is_painted?
     @paint
  end

end
