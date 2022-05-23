class Room
  attr_reader :category, :length, :witdh, :area, :paint

  def initialize(category, length, witdh)
    @category = category
    @length = length
    @witdh = witdh
    @paint = false
  end
  def area
    @area = @length * @witdh.to_i
  end
  def is_painted?
    @paint
  end

  def paint
    @paint = true

  end

end
