class CreateDrinkHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :drink_histories do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :beer, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
