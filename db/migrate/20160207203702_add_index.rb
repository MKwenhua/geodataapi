class AddIndex < ActiveRecord::Migration
  def change
  	add_index :stores, :lat
  	add_column :stores, :mongo, :string
  end
end
