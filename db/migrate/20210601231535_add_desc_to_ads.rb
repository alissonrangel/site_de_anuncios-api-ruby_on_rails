class AddDescToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :desc, :string
  end
end
