class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.string :location
      t.string :city
      t.string :country
      t.string :postalCode
      t.string :code
      t.integer :minPrice
      t.boolean :isDelivery

      t.timestamps null: false
    end
  end
end
