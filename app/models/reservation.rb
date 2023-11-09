class Reservation < ApplicationRecord
  belongs_to :book, dependent: :destroy
  belongs_to :member

  scope :reserved, -> { where(state: :reserved) }
  scope :open, -> { where(state: %i[reserved lent]) }

  state_machine initial: :reserved do
    event :lend do
      transition reserved: :lent
    end

    # Not using return as it is a reserved keyword in Ruby
    event :return_book do
      transition lent: :returned
    end
  end
end
