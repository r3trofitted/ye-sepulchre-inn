require "application_system_test_case"

class SitAndPlaysTest < ApplicationSystemTestCase
  test "joining a game in progress" do
    @game = games(:at_third_call)
    
    visit "/games/#{@game.id}"
    
    ordered_players_list = find("#players")
    assert_equal "Charlotte Ahmed Benoît", ordered_players_list.text(normalize_ws: true)
    
    Capybara.using_session("New player") do
      visit "/games/#{@game.id}/join?name=Daniel"
      
      ordered_players_list = find("#players")
      assert_equal "Charlotte Daniel Ahmed Benoît", ordered_players_list.text(normalize_ws: true)
    end
    
    ordered_players_list = find("#players")
    assert_equal "Daniel Ahmed Benoît Charlotte", ordered_players_list.text(normalize_ws: true)
  end
end
