class RemoveLaunguageCountryFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :language
  end
end
