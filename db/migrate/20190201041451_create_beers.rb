class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.integer :brewary_db_id

      t.timestamps
    end
  end
end
