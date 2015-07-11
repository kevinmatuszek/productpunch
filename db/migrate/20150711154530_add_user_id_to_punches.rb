class AddUserIdToPunches < ActiveRecord::Migration
  def change
    add_column :punches, :user_id, :integer
    add_index :punches, :user_id
  end
end
