class ModifyColorOfCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :color, :string
    add_attachment :cards, :color
  end
end
