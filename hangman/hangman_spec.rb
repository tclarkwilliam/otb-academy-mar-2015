class Game
  attr_reader :lives
  
  def initialize(answer)
    @answer = answer
    @lives = 10
    @guesses = []
  end
  
  def guess(character)
    @guesses << character
    if @answer.include?(character)
      true
    else
      @lives -= 1
      false
    end
  end
  
  def board
    @answer.gsub(/[^#{@guesses}]/, "*")
  end
    
end

RSpec.describe "Hangman" do
  
  let(:answer) { "ruby" }
  let(:game) { Game.new(answer) }
  
  it "creates a new game" do
    expect( game.class ).to eq(Game)
  end
    
  it "takes an incorrect guess" do
    expect( game.guess("a") ).to eq(false)
  end
  
  it "takes a correct guess" do
    expect( game.guess("b") ).to eq(true)
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
    
end