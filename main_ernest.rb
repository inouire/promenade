require 'byebug'
require 'gosu'
require_relative 'fond_ernest'
require_relative 'rocket'
require_relative 'star'

module ZOrder
  BACKGROUND, STARS, ROCKET, UI = *0..3
end

SCREEN_WIDTH  = 1280
SCREEN_HEIGHT = 800
SCENE_WIDTH  = 3330
SCENE_HEIGHT = 800

class Main < Gosu::Window
  def initialize
    super SCREEN_WIDTH, SCREEN_HEIGHT
    self.caption = "Starship"

    @fond = FondErnest.new

    @rocket = Rocket.new(@fond)
    @rocket.warp(150, 517)

    # @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
    @stars = Array.new

    @font = Gosu::Font.new(20)
  end

  def update
    # Bouger le fond
    if Gosu.button_down?(Gosu::KB_S)
      @fond.move_left
    end
    if Gosu.button_down?(Gosu::KB_D)
      @fond.move_right
    end

    # Move rocket ship
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @rocket.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @rocket.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @rocket.accelerate
    end
    @rocket.move
    # @rocket.collect_stars(@stars)

    # if rand(100) < 4 and @stars.size < 25
    #   @stars.push(Star.new(@star_anim))
    # end
  end

  def draw
    @fond.draw
    # @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @rocket.draw
    # @stars.each { |star| star.draw }
    @font.draw_text("Vitesse: #{@rocket.velocity}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
    # @font.draw_text("X,Y: #{@rocket.x.floor},#{@rocket.y.floor}", 10, 30, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Main.new.show