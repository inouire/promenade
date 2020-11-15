class Poisson < Element

  def image_path
    if rand(100) < 50
      "media/poisson1.png"
    else
      "media/poisson2.png"
    end
  end

  def z_index
    2
  end

  def ref_on_center
    true
  end

  def initialize(scene)
    super(scene)
    @direction = 1
  end

  def inverse!
    @direction = -@direction
  end

  def move
    if rand(100) < 60
      if rand(1000) < 7
        inverse!
      end
      @x = @x + @direction

      if @x < 1000
        @direction = 1
      elsif @x > 3000
        @direction = -1
      end
    end

  end

end