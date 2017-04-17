class AddStoreIdToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :store_id, :integer
  end
end
