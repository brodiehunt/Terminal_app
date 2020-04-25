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
song = Music.new('./../media/supermario.mp3')
fantastic_sample = Sound.new('./../media/fantastic.wav')
dream_dead_sample = Sound.new('./../media/dream_dead.wav')
song.play

update do 
  clear
  game.draw
  close if game.game_stage == 'quit'
  if game.game_stage == 'play'
    unless trump.hit_itself
      trump.move_trump
      trump.check_borders
      coin.draw
      trump.draw
    end
    if trump.hit_itself
      game.game_stage = 'pause'
      song.pause
      dream_dead_sample.play
    end
    if coin.trump_collect?(trump.collision_x, trump.collision_y)
      coin.change_location
      trump.increase_size
      game.score_increase
      fantastic_sample.play
    end
  end
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
  when 'r'
    trump = Trump.new
    coin = Coin.new
    game = Game.new
    song.play
  when 'p'
    game.game_stage= 'play'
  when 't'
    game.game_stage= 'quit'
  end
end
show 


