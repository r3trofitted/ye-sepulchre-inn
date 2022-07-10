require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "players#register adds a new player and assigns their position" do
    game = Game.create
    
    antoine = game.players.register(name: "Antoine")
    assert_equal 1, antoine.position
    
    benjamin = game.players.register(name: "Benjamin")
    assert_equal 2, benjamin.position
  end
end
