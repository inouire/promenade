class Element

  attr_reader :scene
  attr_reader :width, :height
  attr_reader :x, :y


  # To override for config
  def dimension
    [50, 50]
  end

  def image_path
    "media/starfighter.bmp"
  end

  def z_index
    1
  end

  # To override for animation
  def is_visible?
    true
  end

  def ref_on_center
    true
  end

  # Generic methods, can still be overriden
  def initialize(scene)
    @scene = scene
    @width, @height = dimension
    @image = Gosu::Image.new(image_path)
    @x, @y = 0, 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def screen_x
    @x - @scene.offset_x
  end

  def screen_y
    @y - @scene.offset_y
  end

  def autocam
    while screen_x > @scene.screen_width - 300 && @scene.can_move_right? do
      @scene.move_right
    end
    while screen_x < 300 && @scene.can_move_left? do
      @scene.move_left
    end
  end

  def draw
    if is_visible?
      if ref_on_center
        @image.draw_rot(screen_x, screen_y, z_index, 0)
      else
        @image.draw(screen_x, screen_y, z_index)
      end
    end
  end

end