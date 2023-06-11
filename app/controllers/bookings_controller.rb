class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:passengers].to_i.times{ @booking.passengers.build }
    @flight = Flight.find( params[:flight_id] )
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
        @booking.passengers.each do |p|
          PassengerMailer.confirmation_email(p).deliver_later
        end
        redirect_to @booking, notice: "You have sucessfully booked the flight!"
    else
        render :new, status: :unprocessable_entity  
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
