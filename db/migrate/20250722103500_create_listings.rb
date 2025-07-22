class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :len, null: false, foreign_key: true
      t.integer :daily_rate
      t.text :owner_description

      t.timestamps
    end
  end
end
