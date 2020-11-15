class Windows < Element

  def image_path
    "media/window-overlay.png"
  end

  def z_index
    4
  end

  def ref_on_center
    false
  end

  def initialize(scene)
    super(scene)
    @is_lighted = true
  end

  def toggle_light
    @is_lighted = !@is_lighted
  end

  def is_visible?
    !@is_lighted
  end

end