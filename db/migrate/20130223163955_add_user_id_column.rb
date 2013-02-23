class AddUserIdColumn < ActiveRecord::Migration
  def up
    add_column :papers, :user_id, :integer
  end

  def down
  end
end
