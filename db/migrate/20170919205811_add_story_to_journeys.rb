class AddStoryToJourneys < ActiveRecord::Migration[5.1]
  def change
    add_column :journeys, :story, :text
  end
end
