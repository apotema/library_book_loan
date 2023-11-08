class Book < ApplicationRecord
  has_many :reservations, dependent: :destroy

  def can_be_reserved?
    reservations.where(status: %w[reserved lent]).any?
  end
end
