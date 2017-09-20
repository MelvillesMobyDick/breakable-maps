class RemoveStoryFromJourneys < ActiveRecord::Migration[5.1]
  def change
    remove_column :journeys, :story, :text
  end
end
