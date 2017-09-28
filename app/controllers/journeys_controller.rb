class JourneysController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
    @journey = Journey.new
    @comments = @journey.comments
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    if @journey.save
      redirect_to journey_path(@journey, @comment)
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
    @comments = @journey.comments
  end

  private

  def journey_params
    params.require(:journey).permit(:origin, :destination, :hours, :minutes, :user_id)
  end

end
