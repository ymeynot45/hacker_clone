class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :opinion, null: false
      t.integer :post_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
