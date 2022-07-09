class PlayersController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    
    player = game.players.create!(player_params) # TODO: assign the position
    session[:player_id] = player.id
    redirect_to game
  end
  
  private
  
  def player_params
    params.permit(:name)
  end
end
