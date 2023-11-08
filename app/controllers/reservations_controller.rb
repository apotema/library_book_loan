class ReservationsController < ApplicationController
  before_action :authenticate_user!

  before_action :check_existing_reservation, only: [:create]

  def create
    @reservation = member.reservations.create(reservation_params)
    if @reservation.persisted?
      redirect_to :books, notice: "Reservation '#{@reservation.id}' was successfully created."
    else
      redirect_to :books, alert: 'Reservation could not be created.'
    end
  end

  def reservation_params
    params.permit(:book_id, :pick_up_time)
  end

  private

  def check_existing_reservation
    return unless Reservation.exists?(book_id: reservation_params[:book_id])

    redirect_to :books, alert: 'Book is already reserved.'
  end
end
