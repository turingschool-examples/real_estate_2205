class Room
  attr_reader :category, :length, :width, :painted
  def initialize (category, length, width)
    @category = category
    @length = length
    @width = width
    @area = []
    @painted = []
  end

  def area
    @width.to_i * @length
  end

  def paint
    @painted << painted
  end

  def is_painted?
    if @painted == []
      false
    else
      true
    end
  end
end
