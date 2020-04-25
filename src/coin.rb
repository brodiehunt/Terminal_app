class Coin
  def initialize
    @x = rand(WIDTH)
    @y = rand(HEIGHT)
  end

  def draw
    coin = Sprite.new('./../media/coin.png', clip_width: 40, time: 300, loop: true, x: @x * GRID_SIZE, y: @y * GRID_SIZE) 
  end
end