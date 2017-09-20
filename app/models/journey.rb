class Journey < ApplicationRecord
  validates :origin, presence: true
  validates :destination, presence: true
  validates :travel_time, presence: true 
end
