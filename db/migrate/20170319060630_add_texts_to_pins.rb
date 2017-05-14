class AddTextsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :toptext, :string
    add_column :pins, :bottomtext, :string
  end
end
 