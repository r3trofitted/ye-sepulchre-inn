require "application_system_test_case"

class SitAndPlaysTest < ApplicationSystemTestCase
  def setup
    @game = games(:at_third_call)
  end
  
  test "joining a game in progress" do
    visit "/games/#{@game.id}"
    
    ordered_players_list = find("#players")
    assert_equal "Charlotte Ahmed Benoît", ordered_players_list.text(normalize_ws: true)
    
    Capybara.using_session("New player") do
      visit "/games/#{@game.id}/join?name=Daniel"
      
      ordered_players_list = find("#players")
      assert_equal "Charlotte Daniel Ahmed Benoît", ordered_players_list.text(normalize_ws: true)
      # TODO: assert that Daniel is the current player
    end
    
    ordered_players_list = find("#players")
    assert_equal "Daniel Ahmed Benoît Charlotte", ordered_players_list.text(normalize_ws: true)
  end
  
  test "leaving a game" do
    visit "/games/#{@game.id}"
    
    Capybara.using_session("New player") do
      visit "/games/#{@game.id}/join?name=Daniel"
    end
    
    ordered_players_list = find("#players")
    assert_equal "Daniel Ahmed Benoît Charlotte", ordered_players_list.text(normalize_ws: true)
    
    Capybara.using_session("New player") do
      click_on "Leave the game"
    end
    
    ordered_players_list = find("#players")
    assert_equal "Charlotte Ahmed Benoît", ordered_players_list.text(normalize_ws: true)
  end
end
