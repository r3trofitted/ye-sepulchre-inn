class Game < ApplicationRecord
  has_many :players, -> { extending PlayersExtension }, dependent: :destroy,
           after_add: :refesh_players_list, 
           after_remove: :refesh_players_list
  
  private
  
  def refesh_players_list(new_player)
    players.excluding(new_player).each do |player|
      broadcast_replace_later_to player, partial: "games/players", locals: { game: self, player: player }, target: "players"
    end
  end
  
  module PlayersExtension
    def ordered_for(player)
      order(:position)
        .to_a
        .then { |ps| ps.rotate!(ps.index(player) - (ps.size/2.0).ceil + 1) }
    end

    def register(player_attributes)
      create(player_attributes.merge(position: maximum(:position).to_i + 1))
    end
  end
end
