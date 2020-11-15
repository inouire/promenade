require_relative 'src/lib/element'

class Boat < Element

  def dimension
    [403, 275]
  end

  def image_path
    "media/bateau.png"
  end

  def z_index
    2
  end

  def initialize(scene)
    super(scene)

    @pouet = Gosu::Sample.new("media/pouet.wav")
    @pilot = nil
    @rot = 0
    @dirot = 0.1
  end

  attr_accessor :pilot

  def warp(x, y)
    @x, @y = x, y
  end

  def has_pilot?
    !@pilot.nil?
  end

  def sync_pilot
    @pilot.warp(@x - 125, @y - 25)
  end

  def swing
    @rot += @dirot
    if @rot > 4 || @rot < -4
      @dirot = - @dirot
    end
  end

  def go_left
    if has_pilot?
      @x -= 12
      @x = 1330 if @x < 1330
      autocam
      sync_pilot
    end
  end

  def go_right
    if has_pilot?
      @x += 12
      @x = SCENE_WIDTH if @x > SCENE_WIDTH
      autocam
      sync_pilot
    end
  end

  def go_up
  end
  def go_down
  end

  def pouet
    @pouet.play
  end

  def draw
    @image.draw_rot(screen_x, screen_y, z_index, @rot)
  end

end