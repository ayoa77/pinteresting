class RemoveAttachmentImageFromPin < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :pins, :image
  end
end
