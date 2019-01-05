class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :place_type
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :city_id
      t.integer :state_id
      t.integer :country_id

      t.timestamps
    end
    add_index :places, [:latitude, :longitude]
  end
end
