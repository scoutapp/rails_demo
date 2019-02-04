class AddMoreColumnsToBeer < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :name, :string
    add_column :beers, :description, :text
    add_column :beers, :abv, :float
    add_column :beers, :is_retired, :boolean
    add_column :beers, :is_organic, :boolean
    add_column :beers, :image_path_small, :string
    add_column :beers, :image_path_medium, :string
    add_column :beers, :image_path_large, :string
  end
end
