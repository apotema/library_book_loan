# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :pick_up_time
      t.references :book, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.timestamps
    end
  end
end
