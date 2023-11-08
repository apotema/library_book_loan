require 'rails_helper'

RSpec.describe 'books/edit', type: :view do
  let(:book) do
    Book.create!
  end

  before(:each) do
    assign(:book, book)
  end

  it 'renders the edit book form' do
    render

    assert_select 'form[action=?][method=?]', book_path(book), 'post' do
    end
  end
end
