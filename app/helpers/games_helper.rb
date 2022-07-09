module GamesHelper
  def ordered_players(game)
    players = game.players.order(:position).to_a
    
    players.rotate!(players.index(Current.player) - (players.size/2))
  end
end
