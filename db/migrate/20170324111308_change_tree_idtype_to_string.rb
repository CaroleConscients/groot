class ChangeTreeIdtypeToString < ActiveRecord::Migration[5.0]
  def change
    change_column(:cards, :tree_id, :string)
  end
end
