require 'rails_helper'

RSpec.describe 'Books', type: :feature do
  let(:member) { create(:member) }
  let!(:book) { create(:book, title: 'The Great Gatsby', author: 'F. Scott Fitzgerald') }

  before do
    sign_in member.user
  end

  describe 'Book search' do
    it 'allows users to search for books' do
      visit books_path

      within '.form-inline' do
        fill_in 'Search by title or author:', with: 'Great'
        click_on 'Search'
      end

      expect(page).to have_content('The Great Gatsby')
      expect(page).to have_content('F. Scott Fitzgerald')
    end
  end

  describe 'Making a reservation' do
    context 'when the book can be reserved' do
      let!(:book_unreserved) { create(:book, title: 'The Catcher in the Rye', author: 'J. D. Salinger') }

      it 'allows creating a new reservation' do
        visit books_path

        expect(page).to have_button('Reserve this book')
        within "#book_#{book_unreserved.id}" do
          fill_in 'Reservation Date and Time:', with: 1.day.from_now.strftime('%Y-%m-%dT%H:%M')
          click_on 'Reserve this book'
        end

        expect(page).to have_content('was successfully created')
      end
    end

    context 'when the book cannot be reserved' do
      before do
        allow_any_instance_of(Book).to receive(:can_be_reserved?).and_return(false)
      end

      it 'shows that the book is already reserved' do
        visit books_path
        within "#book_#{book.id}" do
          expect(page).to have_content('This book is already reserved.')
        end
      end
    end
  end
end
