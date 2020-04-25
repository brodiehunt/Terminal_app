class Game 
  attr_accessor :game_stage, :score
  def initialize
    @score = 0 
    @game_stage = 'start'
  end

  def draw
    change_text_display
  end

  def change_text_display
    if @game_stage == 'start'
      Image.new('./../media/trump_background.png', x: 110, y: 50, width: 600, height: 400)
      Text.new("WELCOME! PRESS 'P' TO PLAY", x: 60, y: 450, size: 45, color: 'red')
      Text.new("'W'=UP, 'S'=DOWN, 'A'=LEFT, 'D'=RIGHT", x: 20, y:500, size: 40, color: 'blue')
    elsif @game_stage == 'play'
      Text.new("Score: #{@score}", x: 10, y: 560, color: 'white', size: 30)
    else 
      Image.new('./../media/trump_pepe.png', x: 110, y:50, width: 600, height: 400)
      Text.new("YOU DIED!!!! YOUR SCORE IS #{@score}", x: 20, y: 450, color: 'red', size: 40)
      Text.new("PRESS 'R' TO RESTART, 'T' TO QUIT", x: 20, y: 500, color: 'blue', size: 45)
    end
  end
  
  def score_increase
    @score += 10
  end
end

  

