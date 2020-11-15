require_relative 'lib/element'

class Crochet < Element

  def dimension
    [47, 500]
  end

  def image_path
    "media/crochet.png"
  end

  def z_index
    2
  end

  def ref_on_center
    false
  end

  def initialize(scene)
    super(scene)

    @sound = Gosu::Sample.new("media/chaine-short.mp3")
  end

  def grince
    @sound.play
  end

  def go_up
    @y -= 5
    @y = -345 if !can_go_up?
  end

  def go_down
    @y += 5
    @y = 50 if !can_go_down?
  end

  def can_go_up?
    @y > -345
  end

  def can_go_down?
    @y < 50
  end

end