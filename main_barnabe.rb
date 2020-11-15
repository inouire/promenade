require 'byebug'
require 'gosu'
require_relative 'dragon'
require_relative 'boat'
require_relative 'star'
require_relative 'src/lighthouse_scene'

module ZOrder
  BACKGROUND, STARS, Rocket, UI = *0..3
end

SCREEN_WIDTH  = 1280
SCREEN_HEIGHT = 800
SCENE_WIDTH  = 3330
SCENE_HEIGHT = 800

class Main < Gosu::Window
  def initialize
    super SCREEN_WIDTH, SCREEN_HEIGHT
    self.caption = "Promenade"

    @scene = LighthouseScene.new

    @dragon = Dragon.new(@scene)
    @dragon.warp(400, 500)

    @boat = Boat.new(@scene)
    @boat.warp(1400, 540)

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
      @boat.go_left
    end
    if Gosu.button_down?(Gosu::KB_RIGHT)
      @dragon.go_right
      @boat.go_right
    end
    if Gosu.button_down?(Gosu::KB_UP)
      @dragon.go_up
      @boat.go_up
    end
    if Gosu.button_down?(Gosu::KB_DOWN)
      @dragon.go_down
      @boat.go_down
    end

    # Monter dans le boat
    if Gosu.button_down?(Gosu::KB_G) && Gosu.distance(@dragon.x, @dragon.y, @boat.x, @boat.y) < 350
      @dragon.board(@boat)
    end

    if Gosu.button_down?(Gosu::KB_H) && @dragon.in_boat?
      @dragon.unboard
    end

  end

  def draw
    @scene.draw
    @dragon.draw
    @boat.draw
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    elsif @boat.has_pilot? && Gosu.button_down?(Gosu::KB_K)
      @boat.pouet
    elsif Gosu.button_down?(Gosu::KB_P)
      # @fond.toggle_phare
    else
      super
    end
  end
end

Main.new.show