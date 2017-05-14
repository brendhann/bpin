class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :pin_id
      t.text :body
      t.references :user, index: true
      t.timestamps
    end
    add_index :comments, :pin_id
  end
end
