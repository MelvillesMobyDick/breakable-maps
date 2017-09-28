class Api::V1::JourneysController < ApplicationController
  def show
    @journey = Journey.find(params[:id])
    hours = @journey.hours * 60 * 60
    minutes = @journey.minutes * 60
    travel_time = hours + minutes
    key = ENV["DIRECTIONS_KEY"]
    trip = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@journey.origin}&destination=#{@journey.destination}&mode=transit&key=#{key}")
    render json: { trip: trip, journey: @journey, travel_time: travel_time}
  end
end
