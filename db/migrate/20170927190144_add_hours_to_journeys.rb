class AddHoursToJourneys < ActiveRecord::Migration[5.1]
  def change
    add_column :journeys, :hours, :integer
    add_column :journeys, :minutes, :integer
  end
end
