class PlayersController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    
    game.players.create!(player_params) # TODO: assign the position
    redirect_to game
  end
  
  private
  
  def player_params
    params.permit(:name)
  end
end
