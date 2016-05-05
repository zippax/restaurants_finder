class AddTagsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :tags, :string
  end
end
