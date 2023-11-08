class Member < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :user_id, uniqueness: true
end
