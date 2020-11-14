class Fond
  attr_reader :offset

  def initialize
    @image = Gosu::Image.new("media/fond.png", :tileable => true)
    @phare = Gosu::Image.new("media/phare-overlay.png", :tileable => true)
    @offset = 0
    @is_phare_lighted = false
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

  def toggle_phare
    @is_phare_lighted = !@is_phare_lighted
  end

  def draw
    @image.draw(@offset, 0, 0)
    if @is_phare_lighted
      @phare.draw(@offset, 0, 0)
    end
  end

end