require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let(:user) { create(:user) }

  before do
    create(:book)
  end

  describe 'GET /index' do
    before do
      sign_in user
      get '/books'
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end
  end
end
