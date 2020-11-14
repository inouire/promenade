require_relative 'lib/scene'

class LighthouseScene < Scene

  def initialize
    super
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

end