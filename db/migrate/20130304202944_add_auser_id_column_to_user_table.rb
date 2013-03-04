class AddAuserIdColumnToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :auser_id, :integer
  end
end
