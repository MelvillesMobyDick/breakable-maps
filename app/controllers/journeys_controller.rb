class JourneysController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    if @journey.save
      flash[:notice] = "You're smarter than Google Maps!"
      redirect_to journey_path(@journey)
    else
      flash[:notice] = @journey.errors.full_messages.join(', ')
      render :new
    end
  end

  def index
    @journeys = Journey.all
  end

  def show
    @journey = Journey.find(params[:id])
    trip = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@journey.origin}&destination=#{@journey.destination}&mode=transit&key=AIzaSyAqy98vCg9Hrp2qDHNI_7KWUOoAYCVcYTQ")
  end

  private

  def journey_params
    params.require(:journey).permit(:origin, :destination, :travel_time)
  end

end
