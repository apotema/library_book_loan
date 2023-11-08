class Reservation < ApplicationRecord
  has_one :book
  belongs_to :member
end
