require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'POST /create' do
    let(:user) { create(:user) }
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
