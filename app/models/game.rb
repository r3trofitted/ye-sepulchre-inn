class Game < ApplicationRecord
  has_many :players, after_add: :refesh_players_list, after_remove: :refesh_players_list do
    def register(player_attributes)
      create(player_attributes.merge(position: maximum(:position).to_i + 1))
    end
  end
  
  private
  
  def refesh_players_list(new_player)
    players.excluding(new_player).each do |player|
      PlayersList.new(game: self, current_player: player).broadcast_replace_later_to(player)
    end
  end
end
