class CreatePunches < ActiveRecord::Migration
  def change
    create_table :punches do |t|
      t.string :brand
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
