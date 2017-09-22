class Api::V1::JourneysController < ApplicationController
  def show
    @journey = Journey.find(params[:id])
    key = ENV["DIRECTIONS_KEY"]
    trip = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@journey.origin}&destination=#{@journey.destination}&mode=transit&key=#{key}")
    render json: trip
  end
end
