require_relative 'lib/element'

class Rocket < Element

  WIDTH  = 48
  HEIGHT = 75

  def dimension
    [48, 75]
  end

  def image_path
    "media/rocket.png"
  end

  def z_index
    1
  end

  def ref_on_center
    true
  end

  def initialize(scene)
    super(scene)
    @image = Gosu::Image.new("media/rocket.png")
    @image_flame = Gosu::Image.new("media/rocket-flame.png")
    @image_explosion = Gosu::Image.new("media/explosion.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def turn_left
    @angle -= 4.5 unless @is_exploded
  end

  def turn_right
    @angle += 4.5 unless @is_exploded
  end

  def accelerate
    @vel_x += Gosu.offset_x(@angle, 0.5) unless @is_exploded
    @vel_y += Gosu.offset_y(@angle, 0.5) unless @is_exploded
  end

  def move
    @x += @vel_x
    @y += @vel_y

    @vel_x *= 0.95
    @vel_y *= 0.95

    margin = 5
    @y = margin if @y < margin
    @y = @scene.height - margin if @y > @scene.height - margin
    @x = margin if @x < 0
    @x = @scene.width - margin if @x > @scene.width - margin

    autocam
  end

  def velocity
    (Math.sqrt(@vel_x**2 + @vel_y**2) * 100).floor
  end

  def explode!
    @is_exploded = true
  end

  def reset!
    @is_exploded = false
    @vel_y = @vel_x = @angle = 0
    warp(150, 517)
  end

  def draw
    version = if @is_exploded
      @image_explosion
    elsif velocity > 200
      @image_flame
    else
      @image
    end

    version.draw_rot(screen_x, screen_y, 1, @angle)
  end

  def score
    @score
  end

end