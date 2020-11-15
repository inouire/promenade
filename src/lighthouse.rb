class Lighthouse < Element

  def image_path
    "media/phare-overlay.png"
  end

  def z_index
    4
  end

  def ref_on_center
    false
  end

  def initialize(scene)
    super(scene)
    @is_phare_lighted = false
  end

  def toggle_light
    @is_phare_lighted = !@is_phare_lighted
  end

  def is_visible?
    @is_phare_lighted
  end

end