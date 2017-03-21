class RemoveColorsFromCards < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :cards, :color
  end
end
