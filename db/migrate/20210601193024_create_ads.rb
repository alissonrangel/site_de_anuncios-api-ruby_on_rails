class CreateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :ads do |t|
      t.string :image, null: false
      t.float :price, null: false
      t.boolean :priceNegotiable, null: false
      t.string :title, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
