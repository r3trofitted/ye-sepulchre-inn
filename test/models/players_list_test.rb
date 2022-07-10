require "test_helper"

class PlayersListTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true
  
  test "ordering a 3-players list from a player's perspective" do
    game = games(:at_third_call)
    
    assert_equal [@charlotte, @ahmed, @benoit], PlayersList.new(game: game, current_player: @ahmed).to_a
    assert_equal [@ahmed, @benoit, @charlotte], PlayersList.new(game: game, current_player: @benoit).to_a
    assert_equal [@benoit, @charlotte, @ahmed], PlayersList.new(game: game, current_player: @charlotte).to_a
  end
  
  test "ordering a 4-players list from a player's perspective" do
    game   = games(:at_third_call)
    daniel = game.players.create name: "Daniel", position: 4
    
    assert_equal [daniel, @ahmed, @benoit, @charlotte], PlayersList.new(game: game, current_player: @ahmed).to_a
    assert_equal [@ahmed, @benoit, @charlotte, daniel], PlayersList.new(game: game, current_player: @benoit).to_a
    assert_equal [@benoit, @charlotte, daniel, @ahmed], PlayersList.new(game: game, current_player: @charlotte).to_a
    assert_equal [@charlotte, daniel, @ahmed, @benoit], PlayersList.new(game: game, current_player: daniel).to_a
  end
  
  test "ordering a 5-players list from a player's perspective" do
    game   = games(:at_third_call)
    daniel = game.players.create name: "Daniel", position: 4
    erica  = game.players.create name: "Daniel", position: 5
    
    assert_equal [daniel, erica, @ahmed, @benoit, @charlotte], PlayersList.new(game: game, current_player: @ahmed).to_a
    assert_equal [erica, @ahmed, @benoit, @charlotte, daniel], PlayersList.new(game: game, current_player: @benoit).to_a
    assert_equal [@ahmed, @benoit, @charlotte, daniel, erica], PlayersList.new(game: game, current_player: @charlotte).to_a
    assert_equal [@benoit, @charlotte, daniel, erica, @ahmed], PlayersList.new(game: game, current_player: daniel).to_a
    assert_equal [@charlotte, daniel, erica, @ahmed, @benoit], PlayersList.new(game: game, current_player: erica).to_a
  end
end
