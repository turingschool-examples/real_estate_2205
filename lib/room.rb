class Room
attr_reader :category, :length, :width
attr_accessor :width
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint = false
  end

  def area
    @length = length
    @width = width.to_i
    return @length * @width
  end

  def is_painted?
    if @paint == true
      false
  else
    true

    end

  end


end
