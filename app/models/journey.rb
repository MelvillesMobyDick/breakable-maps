class Journey < ApplicationRecord
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :travel_time, presence: true

  validates_presence_of :user_id
end
