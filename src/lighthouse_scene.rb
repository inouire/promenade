require_relative 'lib/scene'

class LighthouseScene < Scene

  def initialize
    super
    @grue = Gosu::Image.new("media/grue-overlay.png")
  end

  def image_path
    "media/lighthouse_scene.png"
  end

  def scene_dimension
    [3330, 800]
  end

  def screen_dimension
    [1280, 800]
  end

  def draw
    super
    @grue.draw(-@offset_x, 0, 4)
  end

end