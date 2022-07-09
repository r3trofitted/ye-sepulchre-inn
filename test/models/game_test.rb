require "test_helper"

class GameTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true
  
  test "ordering a 3-players list from a player's perspective" do
    game = games(:at_third_call)
    
    assert_equal [@charlotte, @ahmed, @benoit], game.players.ordered_for(@ahmed)
    assert_equal [@ahmed, @benoit, @charlotte], game.players.ordered_for(@benoit)
    assert_equal [@benoit, @charlotte, @ahmed], game.players.ordered_for(@charlotte)
  end
  
  test "ordering a 4-players list from a player's perspective" do
    game   = games(:at_third_call)
    daniel = game.players.create name: "Daniel", position: 4
    
    assert_equal [daniel, @ahmed, @benoit, @charlotte], game.players.ordered_for(@ahmed)
    assert_equal [@ahmed, @benoit, @charlotte, daniel], game.players.ordered_for(@benoit)
    assert_equal [@benoit, @charlotte, daniel, @ahmed], game.players.ordered_for(@charlotte)
    assert_equal [@charlotte, daniel, @ahmed, @benoit], game.players.ordered_for(daniel)
  end
  
  test "ordering a 5-players list from a player's perspective" do
    game   = games(:at_third_call)
    daniel = game.players.create name: "Daniel", position: 4
    erica  = game.players.create name: "Daniel", position: 5
    
    assert_equal [daniel, erica, @ahmed, @benoit, @charlotte], game.players.ordered_for(@ahmed)
    assert_equal [erica, @ahmed, @benoit, @charlotte, daniel], game.players.ordered_for(@benoit)
    assert_equal [@ahmed, @benoit, @charlotte, daniel, erica], game.players.ordered_for(@charlotte)
    assert_equal [@benoit, @charlotte, daniel, erica, @ahmed], game.players.ordered_for(daniel)
    assert_equal [@charlotte, daniel, erica, @ahmed, @benoit], game.players.ordered_for(erica)
  end
end
