class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :position, null: false, default: 1
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
