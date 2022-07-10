class PlayersList
  include Enumerable
  include Turbo::Broadcastable
  include ActiveModel::Model
  include GlobalID::Identification
  
  attr_accessor :game, :current_player
  
  delegate :each, to: :players
  
  def self.find(id)
    game_id, player_id = id.split ":"
    
    new game: Game.find(game_id), current_player: Player.find_by(game_id: game_id, id: player_id)
  end

  def id
    [game.id, current_player.id].join(":")
  end
  
  def players
    @players ||= @game.players.order(:position)
                   .to_a
                   .then { |ps| ps.rotate!(ps.index(@current_player) - (ps.size/2.0).ceil + 1) }
  end
end
