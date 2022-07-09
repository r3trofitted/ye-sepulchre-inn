class GamesController < ApplicationController
  before_action :set_game, :set_current_player
  
  def show
  end
  
  private
  
  def set_game
    @game = Game.find params[:id]
  end
  
  def set_current_player
    Current.player = @game.players.find_by(id: session[:player_id]) || @game.players.first # FIXME: get rid of the fallback
  end
end
