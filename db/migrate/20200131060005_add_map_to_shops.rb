class AddMapToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :map, :string
  end
end
