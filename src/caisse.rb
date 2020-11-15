require_relative 'lib/element'

class Caisse < Element


  def dimension
    [100, 100]
  end

  def image_path
    "media/caisse.png"
  end

  def z_index
    1
  end

  def ref_on_center
    true
  end

  def initialize(scene)
    super(scene)
    @boat = nil
    @crochet = nil
  end

  def loaded?
    @boat
  end

  def load(boat)
    @boat    = boat
    @crochet = nil
  end

  def unload(crochet)
    @crochet = crochet
    @boat    = nil
  end

  def screen_x
    if @boat
      @boat.screen_x + 100
    elsif @crochet
      @crochet.screen_x + 20
    else
      -100
    end
  end

  def screen_y
    if @boat
      @boat.screen_y
    elsif @crochet
      @crochet.screen_y + 520
    else
      -100
    end
  end

end