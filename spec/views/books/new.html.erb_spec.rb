# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  before do
    assign(:book, Book.new)
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
    end
  end
end
