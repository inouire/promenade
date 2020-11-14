class Boat

  WIDTH  = 403
  HEIGHT = 275

  attr_reader :x
  attr_reader :y
  attr_accessor :pilot

  def initialize(fond)
    @fond  = fond
    @image = Gosu::Image.new("media/bateau.png")
    @pouet = Gosu::Sample.new("media/pouet.wav")
    @x = @y = 0
    @pilot = nil
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def has_pilot?
    !@pilot.nil?
  end

  def screen_x
    @x + @fond.offset - (WIDTH / 2)
  end

  def screen_y
    @y - HEIGHT
  end

  def go_left
    if has_pilot?
      @x -= 15
      @x = 0 if @x < 0
      adjust_fond
    end
  end

  def go_right
    if has_pilot?
      @x += 15
      @x = SCENE_WIDTH if @x > SCENE_WIDTH
      adjust_fond
    end
  end

  def go_up
    if has_pilot?
      @y -= 15
      @y = 0 if @y < 0
    end
  end

  def go_down
    if has_pilot?
      @y += 15
      @y = SCENE_HEIGHT if @y > SCENE_HEIGHT
    end
  end

  def pouet
    @pouet.play
  end

  def adjust_fond
    while screen_x > (SCREEN_WIDTH - 2 * WIDTH)  && @fond.can_move_right? do
      @fond.move_right
    end
    while screen_x < WIDTH && @fond.can_move_left? do
      @fond.move_left
    end
  end

  def draw
    @image.draw(screen_x, screen_y, 1)
  end

end