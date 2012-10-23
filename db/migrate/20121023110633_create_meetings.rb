class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title, :null => false
      t.string :level, :null => false
      t.datetime :start_at, :null => false
      t.datetime :end_at, :null => false
      t.integer :place_id, :null => false
      t.integer :players_count

      t.timestamps
    end
  end
end
