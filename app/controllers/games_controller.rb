class GamesController < ApplicationController
  include CurrentPlayer

  def show
    @game = Game.find params[:id]
    
    # FIXME: get rid of this fallback
    Current.player ||= @game.players.first
  end
end
