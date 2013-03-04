class RemoveColumnsFromUserTable < ActiveRecord::Migration
  def up
    remove_column :users, :password_digest
    remove_column :users, :username
  end

  def down
  end
end
