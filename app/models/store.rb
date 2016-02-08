class Store < ActiveRecord::Base
	LOCFactory = RGeo::ActiveRecord::SpatialFactoryStore.instance.factory(:geo_type => 'point')
end
