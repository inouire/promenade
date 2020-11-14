class FondErnest
  attr_reader :offset

  def initialize
    @image = Gosu::Image.new("media/fond_ernest.png", :tileable => true)
    @offset = 0
  end

  def can_move_left?
    @offset < 0
  end

  def can_move_right?
    @offset > -(SCENE_WIDTH - SCREEN_WIDTH)
  end

  def move_left
    @offset = [@offset + 10, 0].min
  end

  def move_right
    @offset = [@offset - 10, -(SCENE_WIDTH - SCREEN_WIDTH)].max
  end

  def draw
    @image.draw(@offset, 0, 0)
  end

end