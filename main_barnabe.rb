require 'gosu'
require_relative 'fond'
require_relative 'dragon'
require_relative 'player'
require_relative 'star'

module ZOrder
  BACKGROUND, STARS, PLAYER, UI = *0..3
end

SCREEN_WIDTH  = 1280
SCREEN_HEIGHT = 800
SCENE_WIDTH = 4000

class Main < Gosu::Window
  def initialize
    super SCREEN_WIDTH, SCREEN_HEIGHT
    self.caption = "Promenade"

    @fond = Fond.new

    @dragon = Dragon.new(@fond)
    @dragon.warp(1000, 500)

    @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
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

    # Bouger le perso
    if Gosu.button_down?(Gosu::KB_LEFT)
      @dragon.go_left
    end
    if Gosu.button_down?(Gosu::KB_RIGHT)
      @dragon.go_right
    end
    if Gosu.button_down?(Gosu::KB_UP)
      @dragon.go_up
    end
    if Gosu.button_down?(Gosu::KB_DOWN)
      @dragon.go_down
    end

    # if rand(100) < 4 and @stars.size < 25
    #   @stars.push(Star.new(@star_anim))
    # end
  end

  def draw
    @fond.draw
    @dragon.draw

    @stars.each { |star| star.draw }
    # @font.draw_text("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
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