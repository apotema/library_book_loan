# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/index', type: :view do
  before do
    assign(:books, [
             Book.create!,
             Book.create!
           ])
  end

  it 'renders a list of books' do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
