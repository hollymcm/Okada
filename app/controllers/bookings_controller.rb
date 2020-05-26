class BookingsController < ApplicationController

  def new
  	@booking = Booking.new
  end 

  def create
    @bike = bike.find(params[:bike_id])
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    @booking.user = current_user
    @booking.status = "Pending"
    
    if @booking.end_date && @booking.start_date
      @booking.price = (@booking.end_date - @booking.start_date).to_f * @booking.bike.price.to_f
    else
      @booking.price = 0
    end

    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to bike_path(@bike)
    end
  end

  def show
    set_booking
    @bed = @booking.bike
  end

  def update
    set_booking
    @booking.status = "Pending"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end


end