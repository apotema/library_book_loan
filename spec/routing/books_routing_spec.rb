# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/books').to route_to('books#index')
    end
  end
end
