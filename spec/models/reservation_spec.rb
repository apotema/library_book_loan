# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { is_expected.to belong_to(:member) }
  it { is_expected.to belong_to(:book) }

  describe '.reserved' do
    let!(:reserved_reservation) { create(:reservation, state: 'reserved') }

    before do
      create(:reservation, state: 'returned')
    end

    it 'returns only reserved reservations' do
      expect(described_class.reserved).to contain_exactly(reserved_reservation)
    end
  end

  describe '.open' do
    let!(:reserved_reservation) { create(:reservation, state: 'reserved') }
    let!(:lent_reservation) { create(:reservation, state: 'lent') }

    before do
      create(:reservation, state: 'returned')
    end

    it 'returns only reservations with reserved or lent status' do
      expect(described_class.open).to contain_exactly(reserved_reservation, lent_reservation)
    end
  end

  describe '#lend!' do
    let(:reservation) { create(:reservation, state: 'reserved') }

    it 'changes the status to lent' do
      reservation.lend!
      expect(reservation.state).to eq('lent')
    end
  end

  describe '#returned!' do
    let(:reservation) { create(:reservation, state: 'lent') }

    it 'changes the status to returned' do
      reservation.return_book!
      expect(reservation.state).to eq('returned')
    end
  end

  describe '.book_is_available' do
    let(:book) { create(:book) }
    let(:member) { create(:member) }
    let(:reservation) { build(:reservation, book:, member:) }

    context 'when the book is not available' do
      before do
        create(:reservation, book:, state: 'reserved')
      end

      it 'is not valid' do
        expect(reservation).not_to be_valid
      end

      it 'return the correct error message' do
        reservation.valid?
        expect(reservation.errors[:book]).to include('is already reserved.')
      end
    end

    context 'when the book is available' do
      it 'is valid' do
        expect(reservation).to be_valid
      end
    end
  end
end
