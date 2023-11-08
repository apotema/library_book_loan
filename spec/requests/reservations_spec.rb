require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  let(:user) { create(:user, role: 'clerk') }
  let(:reservation) { create(:reservation) }

  describe 'POST /returned' do
    context 'when the user is authenticated' do
      before do
        sign_in user
        post returned_reservation_path(reservation)
      end

      it 'updates the reservation status to returned' do
        reservation.reload
        expect(reservation.status).to eq('returned') # Assuming status is a string field
      end

      it 'redirects to the reservations path with a success notice' do
        expect(response).to redirect_to(reservations_path)
        expect(flash[:notice]).to match(/has been returned successfully/)
      end
    end

    context 'when the user is not authenticated' do
      before do
        post returned_reservation_path(reservation)
      end

      it 'does not update the reservation status' do
        reservation.reload
        expect(reservation.status).not_to eq('returned') # Assuming status is a string field
      end

      it 'redirects to the sign-in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /lend' do
    context 'when the user is authenticated' do
      before do
        sign_in user
        post lend_reservation_path(reservation)
      end

      it 'updates the reservation status to lent' do
        reservation.reload
        expect(reservation.status).to eq('lent')
      end

      it 'redirects to the reservations path with a success notice' do
        expect(response).to redirect_to(reservations_path)
        expect(flash[:notice]).to match(/has been lent successfully/)
      end
    end

    context 'when the user is not authenticated' do
      before do
        post lend_reservation_path(reservation)
      end

      it 'does not update the reservation status' do
        reservation.reload
        expect(reservation.status).not_to eq('lent')
      end

      it 'redirects to the sign-in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /index' do
    context 'when the user is authenticated' do
      before do
        sign_in user
        get reservations_path
      end

      it 'has a successful status' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when the user is not authenticated' do
      before do
        get reservations_path
      end

      it 'redirects to the sign-in page' do
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'has a redirect http status' do
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'POST /create' do
    let(:book) { create(:book) }
    let!(:member) { create(:member, user:) }
    let(:reservation_params) { { reservation: { book_id: book.id } } }

    context 'when the user is authenticated' do
      before do
        sign_in user
        post book_reservations_path(book), params: reservation_params
      end

      it 'creates a new reservation' do
        expect(Reservation.count).to eq(1)
      end

      it 'creates a reservation for the current user' do
        expect(Reservation.last.member).to eq(member)
      end

      it 'redirects to a new page' do
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when the book is already reserved' do
      before do
        create(:reservation, book:, member:)
        sign_in user
        post book_reservations_path(book), params: reservation_params
      end

      it 'does not create another reservation' do
        expect(Reservation.where(book_id: book.id).count).to eq(1)
      end

      it 'does not assign the new reservation to the current user' do
        expect(Reservation.last.member).to eq(member)
      end

      it 'redirects to the book page with an alert' do
        expect(response).to redirect_to(books_path)
      end

      it 'set an alert message' do
        expect(flash[:alert]).to match(/already reserved/i)
      end
    end

    context 'when the user is not authenticated' do
      it 'does not create a reservation' do
        post book_reservations_path(book), params: reservation_params
        expect(Reservation.count).to eq(0)
      end

      it 'returns a http status unauthorized' do
        post book_reservations_path(book), params: reservation_params
        expect(response).to have_http_status(:found)
      end
    end
  end
end
