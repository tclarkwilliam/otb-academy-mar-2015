class Game
  attr_reader :lives
  
  def initialize(answer)
    @answer = Word.new(answer)
    @lives = 10
    @guesses = [" "]
  end
  
  def guess(character)
    return "Game Over!" if @lives == 0
    @guesses << character
    return "You win!" if win? 
    if @answer.single_letter?(character)
      "correct guess"
    else
      @lives -= 1
      "incorrect guess"
    end
  end
   
  def win?
    @answer.value.gsub(/[#{regexp}]/, "").size == 0
  end
  
  def board
    @answer.value.gsub(/[^#{regexp}]/, "*")
  end
  
  def regexp
    @guesses.join 
  end
end

class Word
  attr_accessor :value
  
  def initialize(value)
    @value = value
  end
  
  def single_letter?(character)
    @value.include?(character)
  end
  
  def word_guess?(word)
    @value == word
  end
end

RSpec.describe "Hangman" do
  
  let(:answer) { "ruby" }
  let(:game) { Game.new(answer) }
  
  it "creates a new game" do
    expect( game.class ).to eq(Game)
  end
    
  it "takes an incorrect guess" do
    expect( game.guess("a") ).to eq("incorrect guess")
  end
  
  it "takes a correct guess" do
    expect( game.guess("b") ).to eq("correct guess")
  end
  
  it "should decrement lives when guessed incorrectly" do
    lives = game.lives
    game.guess("s")
    expect( game.lives ).to eq( lives - 1)
  end
  
  it "show board with correct letters revealed" do
    game.guess("y")
    expect( game.board ).to eq("***y")
  end

  it "a new game should have a blank board" do
    expect( game.board ).to eq("****")
  end

  
  it "game over when ran out of lives" do
    10.times do
      game.guess("a")
    end
    expect( game.guess("a") ).to eq("Game Over!")
  end
  
  it "win if all letters revealed" do
    game.guess("r")
    game.guess("u")
    game.guess("b")
    expect( game.guess("y") ).to eq("You win!")
  end
  
  it "when word guessed correctly" do
    expect( game.guess("ruby")).to eq("You win!")
  end
    
end