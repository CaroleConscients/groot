class AddCascadeToCards < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :cards, :users
    add_foreign_key :cards, :users, on_delete: :cascade
  end
end
