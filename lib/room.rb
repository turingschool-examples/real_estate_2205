class Room

  attr_reader :category, :length, :width
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint = false
  end

  def area
    area = @length * @width.to_i
    return area
  end

  def is_painted?
    if @paint == true
      return true
    else
      return false
    end
  end

  def paint
    @paint = true
  end
end
