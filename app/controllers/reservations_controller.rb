class ReservationsController < ApplicationController
  before_action :authenticate_user!

  before_action :reservation, only: %i[lend returned]
  before_action :check_existing_reservation, only: [:create]

  def index
    @reservations = Reservation.all
    @reservations = @reservations.where(id: params[:query]) if params[:query].present?
  end

  def create
    @reservation = member.reservations.create(reservation_params)
    if @reservation.persisted?
      redirect_to :books, notice: "Reservation '#{@reservation.id}' was successfully created."
    else
      redirect_to :books, alert: 'Reservation could not be created.'
    end
  end

  def lend
    reservation.lend!
    redirect_to reservations_path, notice: 'The book has been lent successfully.'
  end

  def returned
    reservation.returned!
    redirect_to reservations_path, notice: 'The book has been returned successfully.'
  end

  private

  def reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.permit(:book_id, :pick_up_time)
  end

  def check_existing_reservation
    return unless Reservation.open.exists?(book_id: reservation_params[:book_id])

    redirect_to :books, alert: 'Book is already reserved.'
  end
end
