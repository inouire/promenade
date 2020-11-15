class Scene

  attr_reader :offset_x, :offset_y
  attr_reader :scene_width, :scene_height
  attr_reader :screen_width, :screen_height

  def image_path
    "media/space.png"
  end

  def scene_dimension
    [640, 480]
  end

  def screen_dimension
    [640, 480]
  end

  def initialize
    @image = Gosu::Image.new(image_path, :tileable => true)
    @offset_x = 0
    @offset_y = 0
    @scene_width, @scene_height = scene_dimension
    @screen_width, @screen_height = screen_dimension
  end

  def height
    @scene_height
  end

  def width
    @scene_width
  end

  def offset
    offset_x
  end

  def can_move_left?
    @offset_x > 0
  end

  def can_move_right?
    @offset_x < @scene_width - @screen_width
  end

  def move_left
    @offset_x = [@offset_x - 3, 0].max
  end

  def move_right
    @offset_x = [@offset_x + 3, @scene_width - @screen_width].min
  end

  def draw
    @image.draw(-@offset_x, 0, 0)
  end

end