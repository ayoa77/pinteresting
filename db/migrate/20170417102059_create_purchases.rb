class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :pin_id
      t.integer :buyer_id

      t.timestamps
    end
    add_index :purchases, [:pin_id, :buyer_id]
  end
end
