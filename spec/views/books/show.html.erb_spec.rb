# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/show', type: :view do
  before do
    assign(:book, Book.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
