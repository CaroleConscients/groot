class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.boolean :turned
      t.boolean :last_turned
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
