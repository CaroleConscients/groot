class AddIndexToCards < ActiveRecord::Migration[5.0]
  def change
    add_index :cards, :turned
    add_index :cards, :last_turned
  end
end
