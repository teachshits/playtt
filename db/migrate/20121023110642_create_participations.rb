class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :player_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
