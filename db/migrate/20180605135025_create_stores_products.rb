class CreateStoresProducts < ActiveRecord::Migration
  def change
    create_table :stores_products do |t|
      t.belongs_to :store, index: true
      t.belongs_to :product,  index: true
      t.decimal    :price, precision: 7, scale: 2

      t.timestamps null: false
    end
  end
end
