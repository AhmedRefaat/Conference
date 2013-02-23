class AddStatusColumnToPaperTable < ActiveRecord::Migration
  def change
    add_column :papers, :status, :integer
  end
end
