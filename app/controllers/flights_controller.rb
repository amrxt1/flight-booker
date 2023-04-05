class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{|a| [a.code, a.id] }
    @dates = Flight.all.map{ |f| f.date}.uniq
    
    if !params.has_key?(:arrival_airport)
      @results = nil
    elsif [params[:departing_airport].blank?, params[:arrival_airport].blank?, params[:date].blank?].all?
      flash.now[:error] = "Please select at least one of the three options"
    else
      @results = Flight.where({departing_airport: params[:departing_airport], arrival_airport: params[:arrival_airport]}.reject{ |_, v| v.blank? }) 
    end

  end

  private
  def search_params
    params.permit(:departing_airport, :passengers, :arrival_airport, :date)
  end
end
