# frozen_string_literal: true

class AddReservationToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :reservation, null: true, foreign_key: true
  end
end
