class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :restaurantId
      t.integer :orderInList

      t.timestamps null: false
    end
  end
end
