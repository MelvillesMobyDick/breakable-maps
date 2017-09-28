class Journey < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :origin, presence: true
  validates :destination, presence: true
  validates :hours, presence: true
  validates :minutes, presence: true

  validates_presence_of :user_id
end
