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
    @voff = 0
    @natural = Gosu::Image.new("media/dragon.png")
    @elec = Gosu::Image.new("media/dragon-elec.png")
    @eclair = Gosu::Image.new("media/eclair.png")
    @boat = nil
    @electrocuted = false
  end

  def go_left
    if !in_boat?
      @x -= 7
      @x = 0 if @x < 0
      autocam
      @voff += 2
      @voff %= 15
    end
  end

  def go_right
    if !in_boat?
      @x += 7
      @x = SCENE_WIDTH if @x > SCENE_WIDTH
      autocam
      @voff += 2
      @voff %= 15
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

  def electrocute!
    @electrocuted = !@electrocuted
  end

  def board(boat)
    @boat = boat
    boat.pilot = self
    boat.autocam
    boat.sync_pilot
  end

  def unboard
    @x = @boat.x - 270
    @y = @boat.y
    @boat.pilot = nil
    @boat = nil
    autocam
  end

  def draw
    if !(1145..1698).include?(@x)
      @electrocuted = false
    end

    @image = if @electrocuted
      @elec
    else
      @natural
    end

    if @electrocuted
      @eclair.draw(screen_x - 20, screen_y - 350, z_index)
      # if in_boat?
      #   @eclair.draw(@boat.screen_x - 150, @boat.screen_y - 350, z_index)
      # else
      # end
    end

      super
    if in_boat?
      # @image.draw(@boat.screen_x - 210, @boat.screen_y - 120, z_index)
    else
    end
  end

end