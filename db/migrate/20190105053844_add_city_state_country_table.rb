class AddCityStateCountryTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :countries, :force => true do |t|
			t.column :name, :string
			t.column :short_code, :string
			t.timestamps
		end
		create_table :states, :force => true do |t|
			t.column :name, :string
			t.column :country_id, :integer
			t.column :short_code, :string
			t.timestamps
		end
		create_table :cities, :force => true do |t|
			t.column :name, :string
			t.column :country_id, :integer
			t.column :state_id, :integer
			t.column :short_code, :string
			t.timestamps
		end
  end
end
