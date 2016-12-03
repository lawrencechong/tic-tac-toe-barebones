class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :a
      t.integer :b
      t.integer :c
      t.integer :d
      t.integer :e
      t.integer :f
      t.integer :g
      t.integer :h
      t.integer :i
      t.integer :state
      t.string :winner
      t.string :player1
      t.string :player2
      t.integer :currentPlayer

      t.timestamps
    end
  end
end
