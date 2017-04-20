class ChangeImageToImageUid < ActiveRecord::Migration[5.0]
  def change
remove_column :pins, :image
add_column :pins, :image_uid, :string
  end
end
