class FixEvents < ActiveRecord::Migration

  def self.up
    create_table :events do |t|
      t.string :Title
      t.datetime :startdate
      t.datetime :enddate
      t.text :description
      t.integer :position
      t.integer "event_type_id"

      t.timestamps
    end

    #add_index :event_type, ["event_type_id"]
    add_index :events, :id

    load(Rails.root.join('db', 'seeds', 'events.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "events"})

    Page.delete_all({:link_url => "/events"})

    drop_table :events
  end

end
