class AddPlayer2ToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :player2, :string
  end
end
