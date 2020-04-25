class Trump
  def initialize 
    @direction = 'd'
    @location = [[0, 10], [1, 10], [2, 10]]
  end

  def draw
    @location.each do |index|
      Sprite.new('./../media/trump_move.png', clip_width: 40, time: 20, loop: true, x: index[0] * GRID_SIZE, y: index[1] * GRID_SIZE)
    end
  end

  def direction=(new)
    @direction = new
  end

  def direction
    @direction
  end

  def front_of_trump
    @location[@location.length - 1]
  end

end