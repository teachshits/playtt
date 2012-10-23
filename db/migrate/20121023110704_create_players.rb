class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :city, :null => false
      t.string :gear
      t.string :level, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :level, :null =>  false
      t.boolean :admin, :null => false, :default => false

      t.timestamps
    end
  end
end
