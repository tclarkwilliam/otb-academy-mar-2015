class Game
  def initialize(answer)
    @answer = answer
    get_guess_from_player
  end
  
  def guess(character)
  end
  
  def get_guess_from_player
    text = gets.chomp!
  end
  
end