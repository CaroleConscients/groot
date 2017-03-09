class AddColorToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :color, :string
  end
end
