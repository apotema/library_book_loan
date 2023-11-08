# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { is_expected.to belong_to(:member) }
  it { is_expected.to belong_to(:book) }

  describe '.reserved' do
    let!(:reserved_reservation) { create(:reservation, status: 'reserved') }

    before do
      create(:reservation, status: 'cancelled')
    end

    it 'returns only reserved reservations' do
      expect(described_class.reserved).to contain_exactly(reserved_reservation)
    end
  end

  describe '.open' do
    let!(:reserved_reservation) { create(:reservation, status: 'reserved') }
    let!(:lent_reservation) { create(:reservation, status: 'lent') }

    before do
      create(:reservation, status: 'returned')
    end

    it 'returns only reservations with reserved or lent status' do
      expect(described_class.open).to contain_exactly(reserved_reservation, lent_reservation)
    end
  end

  describe '#lend!' do
    let(:reservation) { create(:reservation, status: 'reserved') }

    it 'changes the status to lent' do
      reservation.lend!
      expect(reservation.status).to eq('lent')
    end
  end

  describe '#returned!' do
    let(:reservation) { create(:reservation, status: 'lent') }

    it 'changes the status to returned' do
      reservation.returned!
      expect(reservation.status).to eq('returned')
    end
  end
end
