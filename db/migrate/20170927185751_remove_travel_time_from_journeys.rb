class RemoveTravelTimeFromJourneys < ActiveRecord::Migration[5.1]
  def change
    remove_column :journeys, :travel_time, :float
  end
end
