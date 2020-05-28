class BikesController < ApplicationController
 #before_action :set_bike, only: [:show]

  def index
   @bikes = Bike.all
  end
  def show
     @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to bike_path(@bike)
      #render :show
    else
      render :new
    end
  end

   private

   def set_bike
     @bike = Bike.find(params[:id])
   end
  
  def bike_params
    params.require(:bike).permit(:model, :bike_type, :capacity, :price, :address, :img_url)
  end
end
