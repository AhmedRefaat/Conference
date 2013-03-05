class AddPaperStatusColumnInPaperTable < ActiveRecord::Migration
  def up
    remove_column :papers, :status
    add_column :papers, :acceptance, :boolean
  end

  def down
  end
end
