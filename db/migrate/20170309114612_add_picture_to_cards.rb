class AddPictureLinkToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :picture_link, :string
  end
end
