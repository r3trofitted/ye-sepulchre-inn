require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "the players list is ordered according to the current player" do
    game = games(:at_third_call)
    
    get game_join_url(game, name: "Daniel")
    assert_select "ul#players", %w(Benoît Charlotte Daniel Ahmed).join
    
    get game_join_url(game, name: "Erica")
    assert_select "ul#players", %w(Charlotte Daniel Erica Ahmed Benoît).join
  end
end
