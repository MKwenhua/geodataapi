class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.float    :lat
      t.float    :long
      t.string   :email
      t.string   :address
      t.st_point :lonlat, geographic: true
      t.timestamps null: false
    end
  end
end
