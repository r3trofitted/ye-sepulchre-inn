class PlayersController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    
    if player = game.players.register(player_params)
      session[:player_id] = player.id
      redirect_to game
    end
  end
  
  private
  
  def player_params
    params.permit(:name)
  end
end
