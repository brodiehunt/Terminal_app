class Enemy
  attr_reader :enemy_collide 
  def initialize
    @locations = []
    @enemy_collide = false
  end

  def add_enemy
    @locations.push([rand(WIDTH), rand(HEIGHT)])
  end

  def draw 
    @locations.each do |index|
    Square.new(x: index[0] * GRID_SIZE, y: index[1] * GRID_SIZE, size: GRID_SIZE, color: 'red')
    end
  end

  def trump_collide?(head_snake)
    @locations.each do |index|
      if index == head_snake
        @enemy_collide = true 
        break
      end
    end
  end

  
end
