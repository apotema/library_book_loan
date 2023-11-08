# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'members/index', type: :view do
  before do
    assign(:members, [
             create(:member),
             create(:member)
           ])
  end

  it 'renders a list of members' do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
