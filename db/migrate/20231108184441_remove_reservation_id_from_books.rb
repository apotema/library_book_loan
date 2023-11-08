class RemoveReservationIdFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :reservation_id, :bigint
  end
end
