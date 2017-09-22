class AddUserIdToJourneys < ActiveRecord::Migration[5.1]
  def change
    add_column :journeys, :user_id, :integer, null: false
  end
end
