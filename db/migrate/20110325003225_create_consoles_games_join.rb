class CreateConsolesGamesJoin < ActiveRecord::Migration
  def self.up
    create_table :consoles_games, :id => false do |t|
      t.integer "console_id"
      t.integer "game_id"
    end
    add_index :consoles_games, ["console_id", "game_id"]
  end

  def self.down
      drop_table :consoles_games
  end
end
