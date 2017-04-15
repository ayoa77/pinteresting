class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
