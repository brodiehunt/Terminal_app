require 'tty-prompt'
class Display < TTY::Prompt
  attr_accessor :username
  
  def initialize
    super
    @username = 'user'
  end

  def options_array(username)
    if username == 'user'
      [{ name: 'Play', disabled: '(Create username first)'}, 'Create Username', 'Quit']
    else
      ['Play', { name: 'Create Username', disabled: '(Username already accepted)'}, 'Change username', 'How to Play', 'Quit']
    end
  end
  
  def menu_input(prompt_input)
    prompt_input
  end
end

# prompt = Display.new
# loop do 
#   system 'clear'
#   hello = prompt.select("what would you like to do #{prompt.username}?", prompt.options_array(prompt.username))

#   if prompt.menu_input(hello) == 'Login' || prompt.menu_input(hello) == 'Change username'
#     choice = prompt.select("What type of username would you like?", %w[Random Custom])
#     if choice == 'Random'
#       prompt.username=(Faker::FunnyName.name)
#     else
#       username = prompt.ask("Please enter your username!", required: true)
#       prompt.username=(username)
#     end
#   elsif prompt.menu_input(hello) == 'Play'
#     puts 'enters game loop'
#   elsif prompt.menu_input(hello) == 'Quit'
#     puts 'goodbye'.colorize(:blue)
#     break
#   end
# end






