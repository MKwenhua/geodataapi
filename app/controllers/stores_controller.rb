class StoresController < ApplicationController
	before_action :set_store, only: [:show, :update, :destroy]

  def index
   # @stores = Store.all
    #render json:  @stores
  end
  def getstores
  	locFactory = RGeo::ActiveRecord::SpatialFactoryStore.instance.factory(:geo_type => 'point')
  	point =  locFactory.point(params[:lng], params[:lat])
  	@nearby = Store.where('st_dwithin(lonlat,?,?)',point, 800)
  	render json:  @nearby

  end
  # GET /rails/1
  # GET /rails/1.json
  def show
    render json: @store
  end
  def newstore
  	 @store = Store.create!(:lonlat, :mongo, :lat, :long, :email, :address)
  	 
  	if request.xhr?
        		 render :json => {
                           :setRedis =>  ok  
                       }
        end  
  end
  # POST /rails
   # POST /rails.json
  def create
    @store = Store.new(store_params)

    if @store.save
      render json: @store, status: :created, location: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rails/1
  # PATCH/PUT /rails/1.json
  def update
    @store = Store.find(params[:id])

    if @store.update(store_params)
      head :no_content
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rails/1
  # DELETE /rails/1.json
  def destroy
    @store.destroy

    head :no_content
  end

  private

     def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:lonlat, :mongo, :lat, :long, :email, :address)
    end
end
