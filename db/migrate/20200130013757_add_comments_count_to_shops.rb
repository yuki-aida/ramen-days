class AddCommentsCountToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :comments_count, :integer, null: false, default: 0
  end
end
