class CreateJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :journeys do |t|
      t.string :origin, null: false
      t.string :destination, null: false
      t.float :travel_time, null: false
    end
  end
end
