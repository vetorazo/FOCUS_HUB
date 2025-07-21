class CreateLens < ActiveRecord::Migration[7.1]
  def change
    create_table :lens do |t|
      t.string :brand
      t.string :model
      t.string :description

      t.timestamps
    end
  end
end
