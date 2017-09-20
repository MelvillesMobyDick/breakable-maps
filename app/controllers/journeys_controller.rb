class JourneysController < ApplicationController
  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
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
  end

  private

  def journey_params
    params.require(:journey).permit(:origin, :destination, :travel_time)
  end

end
