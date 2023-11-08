class Member < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates_uniqueness_of :user_id
end
