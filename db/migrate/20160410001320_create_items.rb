class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :price
      t.integer :restaurantId
      t.integer :menuId

      t.timestamps null: false
    end
  end
end
