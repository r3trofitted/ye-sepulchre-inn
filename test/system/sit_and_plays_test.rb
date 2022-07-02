require "application_system_test_case"

class SitAndPlaysTest < ApplicationSystemTestCase
  test "joining a game in progress" do
    @game = games(:at_third_call)
    
    visit "/games/#{@game.id}"
    
    within "#players" do
      assert_text "Ahmed"
      assert_text "Benoît"
      assert_text "Charlotte"
      refute_text "Daniel"
    end
    
    Capybara.using_session("New player") do
      visit "/games/#{@game.id}/join?name=Daniel"

      within "#players" do
        assert_text "Ahmed"
        assert_text "Benoît"
        assert_text "Charlotte"
        assert_text "Daniel"
      end
    end
    
    within "#players" do
      assert_text "Daniel"
    end
  end
end
