class RemoveBrandFromPunches < ActiveRecord::Migration
  def change
    remove_column :punches, :brand, :string
  end
end
