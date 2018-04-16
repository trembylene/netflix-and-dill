class ChangeUserstoUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :plants, :users_id, :user_id
  end
end
