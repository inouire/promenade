require_relative 'src/lib/element'

class Dragon < Element

  def dimension
    [175, 200]
  end

  def image_path
    "media/dragon.png"
  end

  # To override for animation
  def is_visible?
    true
  end

  def initialize(scene)
    super(scene)

    @boat = nil
  end

  def go_left
    if !in_boat?
      @x -= 7
      @x = 0 if @x < 0
      autocam
    end
  end

  def go_right
    if !in_boat?
      @x += 7
      @x = SCENE_WIDTH if @x > SCENE_WIDTH
      autocam
    end
  end

  def go_up
    if !in_boat?
      @y -= 7
      @y = 0 if @y < 0
    end
  end

  def go_down
    if !in_boat?
      @y += 7
      @y = SCENE_HEIGHT if @y > SCENE_HEIGHT
    end
  end

  def in_boat?
    !@boat.nil?
  end

  def board(boat)
    @boat = boat
    boat.pilot = self
    boat.pilot.autocam
  end

  def unboard
    @x = @boat.x - 270
    @y = @boat.y
    @boat.pilot = nil
    @boat = nil
    autocam
  end

  def draw
    if in_boat?
      @image.draw(@boat.screen_x - 210, @boat.screen_y - 120, z_index)
    else
      super
    end
  end

end