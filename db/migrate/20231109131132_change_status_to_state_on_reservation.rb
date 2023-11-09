class ChangeStatusToStateOnReservation < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :status, :state
  end
end
