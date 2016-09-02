class AddAttachmentImageToInstaposts < ActiveRecord::Migration
  def self.up
    change_table :instaposts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :instaposts, :image
  end
end
