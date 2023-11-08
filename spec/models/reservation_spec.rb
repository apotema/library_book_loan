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
end
