class AddLikesCountToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :likes_count, :integer, null: false, default: 0
  end
end
