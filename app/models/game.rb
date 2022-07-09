class Game < ApplicationRecord
  has_many :players do
    def ordered_for(player)
      order(:position)
        .to_a
        .then { |ps| ps.rotate!(ps.index(player) - (ps.size/2.0).ceil + 1) }
    end
  end
end
