class Rocket

  WIDTH  = 48
  HEIGHT = 75


  attr_reader :x, :y

  def initialize(fond)
    @fond  = fond
    @image = Gosu::Image.new("media/rocket.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def screen_x
    @x + @fond.offset
  end

  def screen_y
    @y
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    @vel_x += Gosu.offset_x(@angle, 0.5)
    @vel_y += Gosu.offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y

    @vel_x *= 0.95
    @vel_y *= 0.95

    margin = 5
    @y = margin if @y < margin
    @y = SCENE_HEIGHT - margin if @y > SCENE_HEIGHT - margin
    @x = margin if @x < 0
    @x = SCENE_WIDTH - margin if @x > SCENE_WIDTH - margin

    adjust_fond
  end

  def adjust_fond
    while screen_x > (SCREEN_WIDTH - 300) && @fond.can_move_right? do
      @fond.move_right
    end
    while screen_x < 300 && @fond.can_move_left? do
      @fond.move_left
    end
  end

  def draw
    @image.draw_rot(screen_x, screen_y, 1, @angle)
  end

  def score
    @score
  end

  def collect_stars(stars)
    # stars.reject! do |star|
    #   if Gosu.distance(@x, @y, star.x, star.y) < 35
    #     @score += 10
    #     @beep.play
    #     true
    #   else
    #     false
    #   end
    # end
  end

end