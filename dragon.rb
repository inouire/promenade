class Dragon

  WIDTH  = 175
  HEIGHT = 200

  attr_reader :x
  attr_reader :y

  def initialize(fond)
    @fond  = fond
    # @image = Gosu::Image.new("media/dragon.png")
    @image = Gosu::Image.new("media/dragon.png")
    @x = @y = 0
    @boat = nil
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def screen_x
    @x + @fond.offset - (WIDTH / 2)
  end

  def screen_y
    @y - HEIGHT
  end

  def go_left
    if !in_boat?
      @x -= 7
      @x = 0 if @x < 0
      adjust_fond
    end
  end

  def go_right
    if !in_boat?
      @x += 7
      @x = SCENE_WIDTH if @x > SCENE_WIDTH
      adjust_fond
    end
  end

  def go_up
    if !in_boat?
      @y -= 7
      @y = 0 if @y < 0
    end
  end

  def go_down
    if !in_boat?
      @y += 7
      @y = SCENE_HEIGHT if @y > SCENE_HEIGHT
    end
  end

  def adjust_fond
    while screen_x > (SCREEN_WIDTH - 2 * WIDTH) && @fond.can_move_right? do
      @fond.move_right
    end
    while screen_x < WIDTH && @fond.can_move_left? do
      @fond.move_left
    end
  end

  def in_boat?
    !@boat.nil?
  end

  def board(boat)
    @boat = boat
    boat.pilot = self
  end

  def unboard
    @x = @boat.x - 30
    @y = @boat.y
    @boat.pilot = nil
    @boat = nil
  end

  def draw
    if in_boat?
      @image.draw(@boat.screen_x, @boat.screen_y, 3)
    else
      @image.draw(screen_x, screen_y, 3)
    end
  end

end