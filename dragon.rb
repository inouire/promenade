class Dragon

  PERSO_WIDTH  = 50
  PERSO_HEIGHT = 50

  def initialize(fond)
    @fond  = fond
    # @image = Gosu::Image.new("media/dragon.png")
    @image = Gosu::Image.new("media/starfighter.bmp")
    @x = @y = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def screen_x
    @x + @fond.offset - (PERSO_WIDTH / 2)
  end

  def screen_y
    @y - PERSO_HEIGHT
  end

  def go_left
    @x -= 7
    adjust_fond
  end

  def go_right
    @x += 7
    adjust_fond
  end

  def go_up
    @y -= 7
  end

  def go_down
    @y += 7
  end

  def adjust_fond
    if screen_x > (SCREEN_WIDTH - 2 * PERSO_WIDTH)
      @fond.move_right
    elsif screen_x < PERSO_WIDTH
      @fond.move_left
    end
  end

  def draw
    @image.draw(screen_x, screen_y, 1)
  end

end