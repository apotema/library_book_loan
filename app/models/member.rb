# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :user_id, uniqueness: true
end
