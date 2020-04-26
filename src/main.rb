require 'ruby2d'
require_relative './game.rb'
require_relative './coin.rb'
require_relative './trump.rb'
require_relative './tty-prompt.rb'
require_relative './enemy.rb'
require 'tty-prompt'
require 'faker'
require 'colorize'
set background: 'black', title: 'Money Chase'
set width: 800, height: 600, fps_cap: 5
GRID_SIZE = 40
WIDTH = Window.width / GRID_SIZE
HEIGHT = Window.height / GRID_SIZE
game = Game.new 
trump = Trump.new
coin = Coin.new
enemy = Enemy.new
song = Music.new('./../media/supermario.mp3')
fantastic_sample = Sound.new('./../media/fantastic.wav')
dream_dead_sample = Sound.new('./../media/dream_dead.wav')
song.play
prompt = Display.new

loop do 
  system 'clear'
  puts '
      __  ___                          ________                 
     /  |/  /___  ____  ___  __  __   / ____/ /_  ____ _________ 
    / /|_/ / __ \/ __ \/ _ \/ / / /  / /   / __ \/ __ `/ ___/ _ \ 
   / /  / / /_/ / / / /  __/ /_/ /  / /___/ / / / /_/ (__  )  __/ 
  /_/  /_/\____/_/ /_/\___/\__, /   \____/_/ /_/\__,_/____/\___/ 
                          /____/                                    '
  
  menu = prompt.select("what would you like to do #{prompt.username}?", prompt.options_array(prompt.username))

  if prompt.menu_input(menu) == 'Create Username' || prompt.menu_input(menu) == 'Change username'
    choice = prompt.select("What type of username would you like?", %w[Random Custom])
    if choice == 'Random'
      prompt.username=(Faker::FunnyName.name)
    else
      username = prompt.ask("Please enter your username!", required: true)
      prompt.username=(username)
    end
  elsif prompt.menu_input(menu) == 'Quit'
    break
  elsif prompt.menu_input(menu) == 'Play'
    
    update do 
      clear
      game.draw
      close if game.game_stage == 'quit'
      if game.game_stage == 'play' || game.game_stage == 'rescue'
        enemy.trump_collide?(trump.front_of_trump)
        unless trump.hit_itself || enemy.enemy_collide
          trump.move_trump
          trump.check_borders
          coin.draw
          trump.draw
          enemy.draw
        end
        if trump.hit_itself || enemy.enemy_collide
          game.game_stage = 'pause'
          song.pause
          dream_dead_sample.play
        end
        if coin.trump_collect?(trump.collision_x, trump.collision_y)
          coin.change_location
          trump.increase_size
          game.score_increase
          fantastic_sample.play
          enemy.add_enemy
        end
      end
    end
      
    on :key_down do |event|
      case event.key
      when 'd'
        game.game_stage= 'play'
        trump.direction=(event.key) unless trump.direction == 'a'
      when 'a'
        game.game_stage= 'play'
        trump.direction=(event.key) unless trump.direction == 'd'
      when 'w'
        game.game_stage= 'play'
        trump.direction=(event.key) unless trump.direction == 's'
      when 's'
        game.game_stage= 'play'
        trump.direction=(event.key) unless trump.direction == 'w'
      when 'r'
        trump = Trump.new
        coin = Coin.new
        game = Game.new
        enemy = Enemy.new
        song.play
      when 'p'
        game.game_stage= 'play'
      when 't'
        game.game_stage= 'quit'
      else 
        game.game_stage= 'rescue'
      end
    end
    show
    break if game.game_stage == 'quit'
  end
end


