class Book < ApplicationRecord
  belongs_to :reservation, optional: true
end
