class Reservation < ApplicationRecord
  belongs_to :book, dependent: :destroy
  belongs_to :member

  scope :reserved, -> { where(status: :reserved) }
  scope :open, -> { where(status: %i[reserved lent]) }

  def lend!
    update(status: :lent)
  end

  def returned!
    update(status: :returned)
  end
end
