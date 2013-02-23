class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.text :abstract
      t.string :auth1
      t.string :auth2
      t.string :auth3
      t.string :auth4
      t.integer :user_id

      t.timestamps
    end
  end
end
