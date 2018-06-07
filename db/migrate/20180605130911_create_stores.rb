class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string  :name
      t.string  :country
      t.string  :city
      t.string  :address
      t.string  :phone_number
      t.integer :postal_code
      t.string  :working_hours
      t.float   :latitude,  index: true
      t.float   :longitude, index: true

      t.timestamps null: false
    end
  end
end
