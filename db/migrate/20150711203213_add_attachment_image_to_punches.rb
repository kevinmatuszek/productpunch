class AddAttachmentImageToPunches < ActiveRecord::Migration
  def self.up
    change_table :punches do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :punches, :image
  end
end
