class PlayersController < ApplicationController
  include CurrentPlayer
  
  def create
    game = Game.find(params[:game_id])
    
    if player = game.players.register(player_params)
      session[:player_id] = player.id
      redirect_to game
    end
  end
  
  def delete
    game = Game.find(params[:game_id])
    
    if game.players.delete(Current.player)
      session.delete :player_id
      redirect_to game
    end
  end
  
  private
  
  def player_params
    params.permit(:name)
  end
end
