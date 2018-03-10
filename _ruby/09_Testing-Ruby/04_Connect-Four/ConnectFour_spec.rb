require "ConnectFour"


describe ConnectFour do
  it "should" do
    cf = ConnectFour
    game = cf::Game.new
    game.playCmd
  end
end

