class AddJourneyIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :journey_id, :integer, null: false
  end
end
