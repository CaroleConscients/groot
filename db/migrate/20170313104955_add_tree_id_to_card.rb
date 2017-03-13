class AddTreeIdToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :tree_id, :integer
  end
end
