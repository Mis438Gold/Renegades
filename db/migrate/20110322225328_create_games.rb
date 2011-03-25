class CreateGames < ActiveRecord::Migration

  def self.up
    create_table :games do |t|
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :games, :id

    load(Rails.root.join('db', 'seeds', 'games.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "games"})

    Page.delete_all({:link_url => "/games"})

    drop_table :games
  end

end
