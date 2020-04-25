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
  game.draw
  trump.move_trump
  trump.check_borders
  coin.draw
  trump.draw
end

on :key_down do |event|
  case event.key
  when 'd'
    trump.direction=(event.key) unless trump.direction == 'a'
  when 'a'
    trump.direction=(event.key) unless trump.direction == 'd'
  when 'w'
    trump.direction=(event.key) unless trump.direction == 's'
  when 's'
    trump.direction=(event.key) unless trump.direction == 'w'
  end
end

show 


