class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :address, :null => false
      t.string :name, :null => false
      t.string :city, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end
end
