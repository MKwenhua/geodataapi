# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
require 'json'
	locFactory = RGeo::ActiveRecord::SpatialFactoryStore.instance.factory(:geo_type => 'point')
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#businessPath = "#{Rails.root}/public/some.json"
 # businesses = JSON.parse(File.read(businessPath))

#businesses.each do |bb|
#	ll = bb["coord"]
#	 Store.create!(:lonlat => locFactory.point(ll[0], ll[1]), :mongo => bb["mongo"], :lat => ll[0], :long => ll[1], :email => bb['em'], :address => bb["address"])
#end
 stores = Store.all

 stores.each do |ss|
 	yy = ss.lonlat
 	ss.lonlat = locFactory.point(yy.y, yy.x)
 	ss.save
 end
