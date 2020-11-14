class Fond
  attr_reader :offset

  def initialize
    @image = Gosu::Image.new("media/fond.png", :tileable => true)
    @offset = 0
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