class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :adress
      t.string :area
      t.string :station
      t.string :tel
      t.string :business_hour
      t.string :holiday
      t.string :access
      t.text :image

      t.timestamps
    end
  end
end
