class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :brewarydb_id, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
