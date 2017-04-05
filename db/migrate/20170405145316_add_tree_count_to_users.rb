class AddTreeCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tree_count, :integer
  end
end
