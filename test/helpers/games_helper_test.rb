class GamesHelperTest < ActionView::TestCase
  test "#ordered_players orders the players from the current player's perspective" do
    game = games(:at_third_call)
    
    Current.player = players(:charlotte)
    assert_equal [players(:benoit), players(:charlotte), players(:ahmed)], ordered_players(game)
    
    Current.player = players(:ahmed)
    assert_equal [players(:charlotte), players(:ahmed), players(:benoit)], ordered_players(game)
  end
end
