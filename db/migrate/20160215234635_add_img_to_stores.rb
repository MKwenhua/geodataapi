class AddImgToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :name, :string
  	add_column :stores, :imgurl, :string
  end
end
