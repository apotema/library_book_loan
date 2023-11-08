class Reservation < ApplicationRecord
  belongs_to :book, dependent: :destroy
  belongs_to :member
end
