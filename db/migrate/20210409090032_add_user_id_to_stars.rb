class AddUserIdToStars < ActiveRecord::Migration[6.1]
  def change
    add_column :stars, :user_id, :integer
    add_index :stars, :user_id
  end
end
