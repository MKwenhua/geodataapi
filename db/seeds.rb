# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
require 'json'
	locFactory = RGeo::ActiveRecord::SpatialFactoryStore.instance.factory(:geo_type => 'point')
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
busiAdd = "#{Rails.root}/public/other.json"
  busiAT = JSON.parse(File.read(busiAdd))

busiAT.each do |bb|
#	puts bb[:em]
	thisStore = Store.find_by(:email => bb['em'])
	if thisStore != nil
	thisStore.name = bb['ad']
	thisStore.save
end
end
	

#Store.create!(:lat =>  41.891322, :long =>  -87.618995 , :email => "example214@gmail.com", :address => "322 E Illinois St, Chicago, IL 60611", :lonlat => locFactory.point(-87.618995,  41.891322), :mongo =>"56bc0b7ce4b04d5aff53d037")


           

Store.create!(:lat =>  41.876917021450666, :long =>  -87.62456171215058 , 
	:name => "Osaka Express Inc",
	:imgurl => "http://canvasmp3.s3.amazonaws.com/example500@gmail.png", 
	:email => "example500@gmail.com",
	:address => "400 S Michigan Ave, Chicago, IL 60605", 
	:lonlat => locFactory.point(-87.62456171215058,41.876917021450666), 
	:mongo =>"56c78036e4b036a44ac557a4")