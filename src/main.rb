require 'ruby2d'
require_relative './game.rb'
require_relative './coin.rb'
require_relative './trump.rb'
set background: 'black', title: 'Money Chase'
set width: 800, height: 600, fps_cap: 5
GRID_SIZE = 40
WIDTH = Window.width / GRID_SIZE
HEIGHT = Window.height / GRID_SIZE
game = Game.new 
trump = Trump.new
coin = Coin.new

update do 
  clear
  # game.draw
  coin.draw
  trump.draw
end

on :key_down do |event|
  case event.key
  when 'm'
    close
  end
end

show 


