class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :top
      t.string :bottom

      t.timestamps null: false
    end
  end
end
