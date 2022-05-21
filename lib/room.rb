class Room
  attr_reader :category, :area
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @area = @length * @width.to_i
    @painted = false
  end

  def is_painted?
    @painted
  end

  def paint
    @painted = true
  end
end
