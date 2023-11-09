require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { create(:book) }
  let(:member) { create(:member) }

  describe '#can_be_reserved?' do
    let(:book) { create(:book) }

    context 'when there are no open reservations' do
      it 'returns true' do
        expect(book.can_be_reserved?).to eq(true)
      end
    end

    context 'when there are open reservations' do
      before do
        create(:reservation, book:, state: :reserved)
      end

      it 'returns false' do
        expect(book.can_be_reserved?).to eq(false)
      end
    end

    context 'when all reservations are closed' do
      before do
        create(:reservation, book:, state: :returned)
      end

      it 'returns true' do
        expect(book.can_be_reserved?).to eq(true)
      end
    end

    context 'when there are both open and closed reservations' do
      before do
        create(:reservation, book:, state: :returned)
        create(:reservation, book:, state: :reserved)
      end

      it 'returns false' do
        expect(book.can_be_reserved?).to eq(false)
      end
    end
  end

  describe '#reserved_by?' do
    context 'when the book is reserved by the member' do
      before do
        create(:reservation, book:, member:, state: 'reserved')
      end

      it 'returns true' do
        expect(book.reserved_by?(member)).to be true
      end
    end

    context 'when the book is not reserved by the member' do
      it 'returns false' do
        expect(book.reserved_by?(member)).to be false
      end
    end
  end
end
