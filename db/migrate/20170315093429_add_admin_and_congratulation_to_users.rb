class AddAdminAndCongratulationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :users, :congratulation, :boolean, null: false, default: false
  end
end
