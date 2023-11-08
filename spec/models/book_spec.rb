require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { create(:book) }
  let(:member) { create(:member) }

  describe '#can_be_reserved?' do
    context 'when the book is already reserved or lent' do
      before do
        create(:reservation, book:, status: 'reserved')
      end

      it 'returns true' do
        expect(book.can_be_reserved?).to be true
      end
    end

    context 'when the book is not reserved or lent' do
      it 'returns false' do
        expect(book.can_be_reserved?).to be false
      end
    end
  end

  describe '#reserved_by?' do
    context 'when the book is reserved by the member' do
      before do
        create(:reservation, book:, member:, status: 'reserved')
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
