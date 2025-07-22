class ChangeNameLensToLenses < ActiveRecord::Migration[7.1]
  def change
    rename_table :lens, :lenses
  end
end
