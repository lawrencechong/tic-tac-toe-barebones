class AddCurrentPlayerToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :currentPlayer, :integer
  end
end
