class AddColumnUserIdToAd < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :user_id, :integer
  end
end
