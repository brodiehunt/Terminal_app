require 'ruby2d'
class Coin
  def initialize
    @x = rand(WIDTH)
    @y = rand(HEIGHT)
  end
  

  def draw
    coin = Sprite.new('./../media/coin.png', clip_width: 40, time: 300, loop: true, x: @x * GRID_SIZE, y: @y * GRID_SIZE) 
  end

  def trump_collect?(x, y)
    @x == x && @y == y 
  end

  def change_location
    @x = rand(WIDTH)
    @y = rand(HEIGHT)
  end

end