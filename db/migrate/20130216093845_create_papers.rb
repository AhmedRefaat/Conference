class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.string :auth1
      t.srting :auth2
      t.string :auth3
      t.string :auth4
      t.text :abstract

      t.timestamps
    end
  end
end
