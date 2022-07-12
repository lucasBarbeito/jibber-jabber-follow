class RenameFollowedUserColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :follows, :follower_id, :follower_user_id
  end
end
