require_relative 'src/lib/element'

class Boat < Element

  def dimension
    [403, 275]
  end

  def image_path
    "media/bateau.png"
  end

  def initialize(scene)
    super(scene)

    @pouet = Gosu::Sample.new("media/pouet.wav")
    @pilot = nil
  end

  attr_accessor :pilot

  def warp(x, y)
    @x, @y = x, y
  end

  def has_pilot?
    !@pilot.nil?
  end

  def go_left
    if has_pilot?
      @x -= 15
      @x = 0 if @x < 0
      autocam
    end
  end

  def go_right
    if has_pilot?
      @x += 15
      @x = SCENE_WIDTH if @x > SCENE_WIDTH
      autocam
    end
  end

  def go_up
    if false && has_pilot?
      @y -= 15
      @y = 0 if @y < 0
    end
  end

  def go_down
    if false && has_pilot?
      @y += 15
      @y = SCENE_HEIGHT if @y > SCENE_HEIGHT
    end
  end

  def pouet
    @pouet.play
  end

end