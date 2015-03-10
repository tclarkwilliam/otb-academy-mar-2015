class Game
  def initialize(answer)
    @answer = answer
  end
  
  def guess(character)
    @answer.include?(character)
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
  
end