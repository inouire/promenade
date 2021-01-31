require_relative 'lib/element'

class Interior < Element

  def dimension
    [240, 425]
  end

  def image_path
    "media/maison-400.png"
  end

  def z_index
    2
  end

  def initialize(scene)
    super(scene)

    @dragon_small = Gosu::Image.new("media/dragon_small.png")

    @is_visible = true
  end

  attr_accessor :dragon
  attr_accessor :is_visible

  def warp(x, y)
    @x, @y = x, y
  end

  def draw
    if !@dragon.nil?
      @image.draw(screen_x, screen_y, z_index)
      @dragon_small.draw(50, 50, 4)
    end
  end

end