class AddIndexToManufacturersName < ActiveRecord::Migration
  def change
    add_index :manufacturers, :name, unique: true
  end
end
