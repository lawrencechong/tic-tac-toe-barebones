class AddPlayer1ToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :player1, :string
  end
end
