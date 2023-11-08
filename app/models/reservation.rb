# frozen_string_literal: true

class Reservation < ApplicationRecord
  has_one :book
  belongs_to :member
end
