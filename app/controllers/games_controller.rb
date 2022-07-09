class GamesController < ApplicationController
  def show
    @game = Game.find params[:id]
    Current.player ||= @game.players.order(:position).first # SLIME
  end
end
